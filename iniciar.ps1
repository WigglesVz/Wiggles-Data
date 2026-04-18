# =============================================================================
# iniciar.ps1 — Orquestador Modular (Wiggles VZ 5.0)
# Uso remoto: irm https://raw.githubusercontent.com/WigglesVz/Wiggles-Data/master/iniciar.ps1 | iex
# =============================================================================

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# ── PASO 1: Forzar STA PRIMERO (WPF lo requiere) ────────────────────────────
if ([System.Threading.Thread]::CurrentThread.ApartmentState -ne "STA") {
    Write-Host "  [*] Relanzando en modo STA+Admin para WPF..." -ForegroundColor Yellow
    $ScriptUrl = "https://raw.githubusercontent.com/WigglesVz/Wiggles-Data/master/iniciar.ps1"
    $LaunchCmd = "[Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12; iex(irm '$ScriptUrl')"
    $Encoded   = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($LaunchCmd))
    Start-Process powershell.exe `
        -ArgumentList "-STA -NoProfile -ExecutionPolicy Bypass -EncodedCommand $Encoded" `
        -Verb RunAs
    exit
}

# ── PASO 2: Verificar admin (ya en STA) ─────────────────────────────────────
$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(
    [Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Add-Type -AssemblyName System.Windows.Forms
    [System.Windows.Forms.MessageBox]::Show(
        "Ejecuta PowerShell como Administrador.", "Requiere Elevacion", "OK", "Error")
    exit
}

# ── PASO 3: Precargar ensamblados WPF ANTES de cualquier modulo ────────────────
# Necesario porque Invoke-Expression no garantiza que Add-Type en el
# modulo descargado registre el ensamblado antes de usarlo.
Write-Host "  [*] Cargando ensamblados WPF..." -ForegroundColor DarkGray
Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
[void][System.Reflection.Assembly]::LoadWithPartialName('PresentationFramework')

$ErrorActionPreference = "SilentlyContinue"
$host.UI.RawUI.WindowTitle = "WIGGLES_VZ 5.0 // MODULAR"

Write-Host "=============================================" -ForegroundColor Cyan
Write-Host "      Wiggles VZ 5.0 - Modular Edition      " -ForegroundColor Green
Write-Host "=============================================" -ForegroundColor Cyan
Write-Host "  Modo: STA=$([System.Threading.Thread]::CurrentThread.ApartmentState) | Admin=$isAdmin" -ForegroundColor DarkGray

# ── PASO 4: Cargar modulos ───────────────────────────────────────────────────
$BaseUrl  = "https://raw.githubusercontent.com/WigglesVz/Wiggles-Data/master/modules"
$ScriptDir = if ($MyInvocation.MyCommand.Path) { Split-Path -Parent $MyInvocation.MyCommand.Path } else { $null }
$BasePath  = if ($ScriptDir) { Join-Path $ScriptDir "modules" } else { $null }
$UseLocal  = $BasePath -and (Test-Path $BasePath)

$Modules = @("Cloud.ps1", "Tweaks.ps1", "AutoPilot.ps1", "GUI.ps1")

foreach ($mod in $Modules) {
    Write-Host -NoNewline "  [+] $mod..." -ForegroundColor DarkGray
    try {
        if ($UseLocal) {
            $full = Join-Path $BasePath $mod
            if (-not (Test-Path $full)) { throw "No existe localmente: $full" }
            . $full
        } else {
            $code = Invoke-RestMethod -Uri "$BaseUrl/$mod" -ErrorAction Stop
            Invoke-Expression $code
        }
        Write-Host " OK" -ForegroundColor Green
    } catch {
        $ErrorActionPreference = "Continue"
        Write-Host " FALLO: $_" -ForegroundColor Red
        Read-Host "Presiona Enter para cerrar"
        exit 1
    }
}

# ── PASO 5: Cargar entorno ───────────────────────────────────────────────────
Initialize-HybridEnvironment
Load-WigglesConfig   | Out-Null
Load-ProveedoresNube | Out-Null

# ── PASO 6: Lanzar GUI ────────────────────────────────────────────────────────
Initialize-WigglesGUI
