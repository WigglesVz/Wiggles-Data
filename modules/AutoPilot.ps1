# =============================================================================
# AutoPilot.ps1 — Secuencia Desatendida por Recetas JSON (Wiggles VZ 5.0)
# =============================================================================

function Get-AutoPilotRecipe {
    param(
        [string]$RecipeUrl = "https://raw.githubusercontent.com/WigglesVz/Wiggles-Data/main/AutoPilot.json",
        [string]$Manufacturer
    )
    try {
        $recipes = Invoke-RestMethod -Uri $RecipeUrl -ErrorAction Stop
        return $recipes.$Manufacturer
    }
    catch {
        Write-Warning "No se pudo obtener AutoPilot.json"
        return $null
    }
}

function Invoke-VendorInstall {
    param($Recipe, [string]$VendorToolsPath)
    if (-not $Recipe -or -not $VendorToolsPath) { return }

    $exe = Get-ChildItem -Path $VendorToolsPath -Filter "*.exe" -Recurse -ErrorAction SilentlyContinue |
           Select-Object -First 1

    if (-not $exe) {
        Write-Warning "No se encontró instalador para fabricante en $VendorToolsPath"
        return
    }

    $args = $Recipe.silentArgs
    if ($args -eq "SPECIAL_HP") {
        $tmp = "$env:TEMP\Wiggles_HP_Install"
        New-Item -Path $tmp -ItemType Directory -Force | Out-Null
        Start-Process $exe.FullName -ArgumentList "/s /f `"$tmp`"" -Wait -NoNewWindow
        $real = Get-ChildItem $tmp -Include "Install.cmd","Setup.exe","*.msi" -Recurse | Select-Object -First 1
        if ($real) {
            if ($real.Extension -eq ".msi") { Start-Process "msiexec.exe" -ArgumentList "/i `"$($real.FullName)`" /qn" -Wait -NoNewWindow }
            else { Start-Process $real.FullName -Wait -NoNewWindow }
        }
        Remove-Item $tmp -Recurse -Force -ErrorAction SilentlyContinue
    }
    else {
        Start-Process $exe.FullName -ArgumentList $args -Wait -NoNewWindow
    }
}

function Start-WigglesAutoPilot {
    param(
        [Parameter(Mandatory=$true)]$InfoEscaneada,
        [string]$ProveedorNombre = "Genérico",
        [int]$DiasGarantia = 30,
        [string]$Lote = "AUTO"
    )

    # 1. Inventario en nube
    $DatosAuto = [PSCustomObject]@{
        Fecha              = (Get-Date -Format "yyyy-MM-dd")
        LOTE               = $Lote
        Proveedor          = $ProveedorNombre
        Garantia_Hasta     = (Get-Date).AddDays($DiasGarantia).ToString("yyyy-MM-dd")
        Garantia_360       = (Get-Date).AddMonths(6).ToString("yyyy-MM-dd")
        Marca              = $InfoEscaneada.Marca
        Modelo             = $InfoEscaneada.Model
        Serial             = $InfoEscaneada.Serial
        Procesador         = $InfoEscaneada.CPU
        RAM                = $InfoEscaneada.RAM
        Storage            = $InfoEscaneada.Storage
        SistemaOperativo   = $InfoEscaneada.OS
        Tipo               = $InfoEscaneada.Tipo
        Usuario_Registra   = "AUTOPILOT"
        Estado             = "Ingresado"
    }
    Save-To-CentralDB -Datos $DatosAuto | Out-Null

    # 2. Herramienta de fabricante por receta
    $recipe = Get-AutoPilotRecipe -Manufacturer $InfoEscaneada.Marca
    if ($recipe -and $global:VendorToolsPath) {
        $vendorSub = Join-Path $global:VendorToolsPath $InfoEscaneada.Marca
        Invoke-VendorInstall -Recipe $recipe -VendorToolsPath $vendorSub
    }

    # 3. Office (si hay USB)
    if ($global:OfficePath) { Install-Office-Local | Out-Null }

    # 4. Tweaks + Activación
    Invoke-WinScriptTweaks
    Activate-MAS

    # 5. Reporte Telegram
    $msg = @"
✅ AUTO-PILOT FINALIZADO
━━━━━━━━━━━━━━━━━━━━━━
📋 Lote: $Lote
💻 $($InfoEscaneada.Marca) $($InfoEscaneada.Model)
🆔 Serial: $($InfoEscaneada.Serial)
🧠 CPU: $($InfoEscaneada.CPU) | 💾 RAM: $($InfoEscaneada.RAM)
🏢 Proveedor: $ProveedorNombre
📅 Garantía: $((Get-Date).AddDays($DiasGarantia).ToString("yyyy-MM-dd"))
🕐 Fin: $(Get-Date -Format "HH:mm:ss")
"@
    Send-TelegramReport -Message $msg | Out-Null
}
