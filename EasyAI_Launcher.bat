@echo off
setlocal enabledelayedexpansion

REM Define folders
set "MODELS_FOLDER=Models"
set "DATA_FOLDER=Data"

echo.
echo ===========================
echo       Available Models
echo ===========================
echo.

REM List all GGUF files in models folder with index
set /a idx=0
for %%f in ("%MODELS_FOLDER%\*.gguf") do (
    set /a idx+=1
    set "model[!idx!]=%%~nxf"
    echo !idx!^) %%~nxf
)

echo.
set /p MODELINDEX=Select a model by number: 

REM Check if input is valid
if not defined model[%MODELINDEX%] (
    echo Invalid selection!
    pause
    exit /b
)

set MODELNAME=!model[%MODELINDEX%]!
echo Selected model: %MODELNAME%

REM Start llama-server with selected model
echo Starting llama-server with model: %MODELNAME%
start "Llama Server" "%DATA_FOLDER%\llama-server.exe" -m "%MODELS_FOLDER%\%MODELNAME%" --port 8080

REM Start
start "" "http://127.0.0.1:8080"

pause