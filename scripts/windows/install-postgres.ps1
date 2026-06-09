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

$DownloadFolder = Join-Path $env:TEMP "PostgreSQLInstaller"
New-Item -ItemType Directory -Force -Path $DownloadFolder | Out-Null

$Installer = Join-Path $DownloadFolder "postgresql-16-installer.exe"

$Url = "https://get.enterprisedb.com/postgresql/postgresql-16.9-1-windows-x64.exe"

Write-Host "Downloading PostgreSQL Installer..."
Write-Host ""

Invoke-WebRequest `
-Uri $Url `
-OutFile $Installer `
-UseBasicParsing

if(!(Test-Path $Installer))
{
    Write-Host "ERROR: Download Failed"
    exit 1
}

Write-Host "Download Complete"
Write-Host ""

Write-Host "Starting Silent Installation..."
Write-Host ""

Start-Process `
-FilePath $Installer `
-ArgumentList "--mode unattended --superpassword Postgres@123 --serverport 5433 --superaccount postgres" `
-Wait

$PgInstall = Get-ItemProperty `
"HKLM:\SOFTWARE\PostgreSQL\Installations\postgresql-x64-16" `
-ErrorAction SilentlyContinue

if(!$PgInstall)
{
    Write-Host "ERROR: PostgreSQL Installation Failed"
    exit 1
}

Write-Host ""
Write-Host "PostgreSQL Installation Completed"

exit 0
