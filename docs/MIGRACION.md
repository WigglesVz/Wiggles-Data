# Wiggles VZ 5.0 — Guía de Migración

## Estructura generada

```
Wiggles-Data/
├── iniciar.ps1           ← Orquestador (local + remoto)
├── AutoPilot.json        ← Recetas de fabricantes
├── Proveedores.json      ← Sin cambios
├── modules/
│   ├── Cloud.ps1         ← Config, Sheets, Telegram
│   ├── Tweaks.ps1        ← Hardware, mantenimiento
│   ├── AutoPilot.ps1     ← Secuencia desatendida
│   └── GUI.ps1           ← XAML + eventos (extraído)
├── legacy/
│   └── Wiggles_Master.ps1  ← Original intacto
└── docs/
    └── MIGRACION.md
```

## Próximos pasos

1. Crear repo PRIVADO `Wiggles-Config` con `Config.json` que tenga:
   ```json
   {
     "TelegramToken":      "TU_TOKEN_NUEVO",
     "TelegramChatID":     "693806254",
     "GoogleSheetsUrl":    "https://script.google.com/...",
     "ProveedoresJsonUrl": "https://raw.githubusercontent.com/WigglesVz/Wiggles-Data/main/Proveedores.json"
   }
   ```
2. Revocar el token actual de Telegram en @BotFather
3. Validar `modules/GUI.ps1` ejecutando `iniciar.ps1` en la laptop Windows
4. Implementar Runspaces en `Invoke-Task` (siguiente fase)

## IMPORTANTE
- NO borres `legacy/Wiggles_Master.ps1` hasta validar todo
- `GUI.ps1` fue extraído automáticamente; revísalo antes de subir
