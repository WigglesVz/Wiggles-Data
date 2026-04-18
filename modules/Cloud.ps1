# =============================================================================
# Cloud.ps1 — Configuración remota, Google Sheets, Telegram, Proveedores
# =============================================================================

function Load-WigglesConfig {
    param(
        [string]$ConfigUrl = "https://raw.githubusercontent.com/WigglesVz/Wiggles-Config/main/Config.json"
    )
    try {
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        $cfg = Invoke-RestMethod -Uri $ConfigUrl -ErrorAction Stop
        $global:GoogleSheetsUrl    = $cfg.GoogleSheetsUrl
        $global:TelegramToken      = $cfg.TelegramToken
        $global:TelegramChatID     = $cfg.TelegramChatID
        $global:ProveedoresJsonUrl = if ($cfg.ProveedoresJsonUrl) { $cfg.ProveedoresJsonUrl } `
                                     else { "https://raw.githubusercontent.com/WigglesVz/Wiggles-Data/main/Proveedores.json" }
        Write-Host "✅ Config cargada desde repo privado." -ForegroundColor Green
        return $true
    }
    catch {
        Write-Warning "⚠️ No se pudo cargar Config.json remoto: $($_.Exception.Message)"
        return $false
    }
}

function Load-ProveedoresNube {
    try {
        $global:ListaProveedoresData = Invoke-RestMethod -Uri $global:ProveedoresJsonUrl -ErrorAction Stop
        Write-Host "✅ Proveedores cargados desde la nube." -ForegroundColor Cyan
    }
    catch {
        Write-Warning "⚠️ Sin acceso a Proveedores.json. Usando fallback."
        $global:ListaProveedoresData = @(@{ ID=0; Nombre="Genérico (Fallback)"; Garantia_Dias=30 })
    }
}

function Save-To-CentralDB {
    param($Datos)
    if (-not $global:GoogleSheetsUrl) { return $false }
    try {
        $Body = $Datos | ConvertTo-Json -Compress
        Invoke-RestMethod -Uri $global:GoogleSheetsUrl -Method Post `
            -Body $Body -ContentType "application/json; charset=utf-8" -ErrorAction Stop | Out-Null
        return $true
    }
    catch { return $false }
}

function Send-TelegramReport {
    param([string]$Message)
    try {
        $Uri  = "https://api.telegram.org/bot$($global:TelegramToken)/sendMessage"
        $Body = @{ chat_id = $global:TelegramChatID; text = $Message; parse_mode = "HTML" }
        Invoke-RestMethod -Uri $Uri -Method Post -Body $Body `
            -ContentType "application/x-www-form-urlencoded" | Out-Null
        return $true
    }
    catch { return $false }
}
