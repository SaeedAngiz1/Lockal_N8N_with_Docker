@echo off
REM n8n Docker Run Script for Windows
REM This script provides an alternative way to run n8n using docker run command

REM Default values
set TIMEZONE=America/New_York
set CONTAINER_NAME=n8n
set PORT=5678:5678
set VOLUME_NAME=n8n_data

echo Starting n8n with Docker...
echo Timezone: %TIMEZONE%
echo Container Name: %CONTAINER_NAME%
echo Port: %PORT%
echo.

REM Check if .env file exists and load it
if exist .env (
    echo Loading environment variables from .env file...
    for /f "tokens=1,2 delims==" %%a in (.env) do (
        set "%%a=%%b"
    )
)

REM Use GENERIC_TIMEZONE from .env if set, otherwise use default
if defined GENERIC_TIMEZONE (
    set TIMEZONE=%GENERIC_TIMEZONE%
)

REM Run the container
docker run -it --rm ^
  --name %CONTAINER_NAME% ^
  -p %PORT% ^
  -e GENERIC_TIMEZONE=%TIMEZONE% ^
  -e N8N_ENFORCE_SETTING_FILE_PERMISSIONS=true ^
  -e N8N_RUNNERS_ENABLED=true ^
  -v %VOLUME_NAME%:/home/node/.n8n ^
  docker.n8n.io/n8nio/n8n

echo.
echo n8n container stopped.

