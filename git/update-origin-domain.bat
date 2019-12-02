@echo off
set script_path=%~dp0

php "%script_path%update-origin-domain.php" %1


ping -n 4 127.0.0.1 > NUL