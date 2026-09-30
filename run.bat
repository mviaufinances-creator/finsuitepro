@echo off
REM TM Analytics - Finance — local launcher (Windows)
cd /d "%~dp0"
if not exist .venv (
  echo Creating virtual environment...
  py -3 -m venv .venv || python -m venv .venv
  .venv\Scripts\pip install -r requirements.txt
)
if "%SECRET_KEY%"=="" set SECRET_KEY=tm-local-dev-key-change-me
echo.
echo   TM Analytics - Finance is running at http://localhost:5000
echo.
start "" http://localhost:5000
.venv\Scripts\python -m flask --app app run --port 5000
