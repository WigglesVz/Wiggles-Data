# =============================================================================
# iniciar.ps1 — Orquestador Modular (Wiggles VZ 5.0)
# Uso remoto: irm https://raw.githubusercontent.com/WigglesVz/Wiggles-Data/master/iniciar.ps1 | iex
# =============================================================================

$ErrorActionPreference = "SilentlyContinue"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Verificar admin
$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(
    [Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Add-Type -AssemblyName System.Windows.Forms
    [System.Windows.Forms.MessageBox]::Show(
        "Abre PowerShell como Administrador.", "Requiere Elevacion", "OK", "Error")
    exit
}

$host.UI.RawUI.WindowTitle = "WIGGLES_VZ 5.0 // MODULAR"

Write-Host "=============================================" -ForegroundColor Cyan
Write-Host "      Wiggles VZ 5.0 - Modular Edition      " -ForegroundColor Green
Write-Host "=============================================" -ForegroundColor Cyan

# Base de modulos — soporta local O remoto
$BaseUrl  = "https://raw.githubusercontent.com/WigglesVz/Wiggles-Data/master/modules"
$BasePath = Join-Path (Split-Path -Parent $MyInvocation.MyCommand.Path) "modules"
$UseLocal = Test-Path $BasePath

$Modules = @("Cloud.ps1", "Tweaks.ps1", "AutoPilot.ps1", "GUI.ps1")

foreach ($mod in $Modules) {
    Write-Host -NoNewline "  [+] $mod..." -ForegroundColor DarkGray
    try {
        if ($UseLocal) {
            $full = Join-Path $BasePath $mod
            if (-not (Test-Path $full)) { throw "No existe $full" }
            . $full
        }
        else {
            $code = Invoke-RestMethod -Uri "$BaseUrl/$mod" -ErrorAction Stop
            Invoke-Expression $code
        }
        Write-Host " OK" -ForegroundColor Green
    }
    catch {
        Write-Host " FALLO: $_" -ForegroundColor Red
        Read-Host "Presiona Enter para cerrar"
        exit 1
    }
}

# Cargar entorno
Initialize-HybridEnvironment
Load-WigglesConfig | Out-Null
Load-ProveedoresNube | Out-Null

# Lanzar GUI
Initialize-WigglesGUI
