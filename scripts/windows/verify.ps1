. "$PSScriptRoot\..\..\config\app-config.ps1"
. "$PSScriptRoot\logger.ps1"

$env:PGPASSWORD = $Config.PostgreSQL.Password

Write-Host ""
Write-Host "================================="
Write-Host "DEPLOYMENT VERIFICATION"
Write-Host "================================="

Write-Log "VERIFICATION STARTED"

& $Config.PostgreSQL.PsqlPath `
-U $Config.PostgreSQL.Username `
-p $Config.PostgreSQL.Port `
-d $Config.PostgreSQL.Database `
-c "SELECT COUNT(*) AS customers FROM customers;"

if ($LASTEXITCODE -ne 0)
{
    Write-ErrorLog "Verification Failed"
    exit 1
}

& $Config.PostgreSQL.PsqlPath `
-U $Config.PostgreSQL.Username `
-p $Config.PostgreSQL.Port `
-d $Config.PostgreSQL.Database `
-c "SELECT COUNT(*) AS products FROM products;"

& $Config.PostgreSQL.PsqlPath `
-U $Config.PostgreSQL.Username `
-p $Config.PostgreSQL.Port `
-d $Config.PostgreSQL.Database `
-c "SELECT COUNT(*) AS orders FROM orders;"

Write-Host ""
Write-Host "VERIFICATION SUCCESSFUL"

Write-Log "VERIFICATION SUCCESSFUL"
Write-Log "VERIFICATION COMPLETED"
