@echo off
setlocal enableextensions
title PalworldSaveTools VENV Setup

set "SCRIPT_DIR=%~dp0"
cd /d "%SCRIPT_DIR%"

rem Select Python launcher
set "PY="
where py >nul 2>nul && set "PY=py"
if not defined PY set "PY=python"

rem Create venv (prefer 3.12, then 3.11, then default)
if not exist "venv\Scripts\python.exe" (
    echo Creating virtual environment...
    %PY% -3.12 -m venv venv || %PY% -3.11 -m venv venv || %PY% -m venv venv
) else (
    echo Virtual environment already exists.
)

set "VENV_PY=venv\Scripts\python.exe"
echo Using %VENV_PY%

echo Upgrading pip...
"%VENV_PY%" -m pip install --upgrade pip

echo Installing project dependencies...
"%VENV_PY%" -m pip install -e .

echo ========================================
echo Venv ready. Launch tools with menu.cmd
echo ========================================
pause
