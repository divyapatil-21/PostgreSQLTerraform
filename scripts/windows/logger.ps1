. "$PSScriptRoot\..\..\config\app-config.ps1"

function Write-Log {
    param([string]$Message)

    if (!(Test-Path $Config.Logs.LogFolder)) {
        New-Item -ItemType Directory -Path $Config.Logs.LogFolder -Force | Out-Null
    }

    $LogFile = Join-Path $Config.Logs.LogFolder "deployment.log"
    $TimeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    Add-Content -Path $LogFile -Value "$TimeStamp | $Message"
}

function Write-ErrorLog {
    param([string]$Message)

    if (!(Test-Path $Config.Logs.LogFolder)) {
        New-Item -ItemType Directory -Path $Config.Logs.LogFolder -Force | Out-Null
    }

    $ErrorFile = Join-Path $Config.Logs.LogFolder "error.log"
    $TimeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

    Add-Content -Path $ErrorFile -Value "$TimeStamp | ERROR | $Message"
}
