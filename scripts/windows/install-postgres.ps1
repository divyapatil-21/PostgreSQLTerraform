Write-Host ""
Write-Host "================================="
Write-Host "POSTGRESQL DETECTION"
Write-Host "================================="
Write-Host ""

$PgInstall = Get-ItemProperty `
"HKLM:\SOFTWARE\PostgreSQL\Installations\postgresql-x64-16" `
-ErrorAction SilentlyContinue

if($PgInstall)
{
    Write-Host "PostgreSQL Found"
    Write-Host "Location: $($PgInstall.'Base Directory')"
    Write-Host ""
    exit 0
}

Write-Host "PostgreSQL Not Installed"
Write-Host ""

$Installer = Join-Path $PSScriptRoot "..\..\tools\installers\postgresql-16-installer.exe"

if(Test-Path $Installer)
{
    Write-Host "Installer Found"
    Write-Host "Starting Silent Installation..."

    Start-Process `
    -FilePath $Installer `
    -ArgumentList "--mode unattended --superpassword Postgres@123 --serverport 5433 --superaccount postgres" `
    -Wait

    Write-Host ""
    Write-Host "PostgreSQL installation completed."
    Write-Host "Please wait while setup continues..."

    exit 0
}
else
{
    Write-Host "Installer Not Found"
    exit 1
}
