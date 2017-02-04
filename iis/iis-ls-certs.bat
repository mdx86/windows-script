@echo off

set script_path=%~dp0
set ps=%script_path%iis-ls-certs.ps1

Powershell.exe -executionpolicy remotesigned -File  %ps%

pause