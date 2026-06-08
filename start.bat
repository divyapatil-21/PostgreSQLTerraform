@echo off

for /f "delims=" %%i in ('powershell -ExecutionPolicy Bypass -Command ". '%~dp0config\app-config.ps1'; Write-Output $Config.PostgreSQL.PsqlPath"') do set PSQL_PATH=%%i

echo =====================================
echo PostgreSQL Status Check
echo =====================================

sc query postgresql-x64-16

echo.
echo =====================================
echo Database Connection Test
echo =====================================

set PGPASSWORD=Postgres@123

"%PSQL_PATH%" -U postgres -d DataManagementDB -c "SELECT current_database();"

pause
