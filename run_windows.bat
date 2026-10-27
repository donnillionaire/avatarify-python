@echo off
setlocal
cd /d "%~dp0"
call scripts/settings_windows.bat

if exist ".venv\Scripts\python.exe" (
    set "AVATARIFY_PYTHON=%CD%\.venv\Scripts\python.exe"
) else (
    call conda activate %CONDA_ENV_NAME%
    if errorlevel 1 exit /b 1
    set "AVATARIFY_PYTHON=python"
)

set CONFIG=fomm/config/vox-adv-256.yaml

set "PYTHONPATH=%CD%;%CD%\fomm;%PYTHONPATH%"
"%AVATARIFY_PYTHON%" afy/cam_fomm.py --config %CONFIG% --relative --adapt_scale --no-pad --checkpoint vox-adv-cpk.pth.tar %*
exit /b %errorlevel%
