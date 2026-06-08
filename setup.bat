@echo off
title PostgreSQL Infrastructure Automation

echo =====================================
echo PostgreSQL Infrastructure Automation
echo =====================================
echo.

powershell -ExecutionPolicy Bypass -File "%~dp0scripts\windows\precheck.ps1"
if errorlevel 1 exit /b 1

powershell -ExecutionPolicy Bypass -File "%~dp0scripts\windows\install-postgres.ps1"
if errorlevel 1 (
    echo PostgreSQL Installation Required
    exit /b 1
)

powershell -ExecutionPolicy Bypass -File "%~dp0scripts\windows\create-db.ps1"
if errorlevel 1 exit /b 1

powershell -ExecutionPolicy Bypass -File "%~dp0scripts\windows\create-tables.ps1"
if errorlevel 1 exit /b 1

powershell -ExecutionPolicy Bypass -File "%~dp0scripts\windows\load-seed.ps1"
if errorlevel 1 exit /b 1

powershell -ExecutionPolicy Bypass -File "%~dp0scripts\windows\verify.ps1"
if errorlevel 1 exit /b 1

echo.
echo =====================================
echo DEPLOYMENT COMPLETED SUCCESSFULLY
echo =====================================
pause
