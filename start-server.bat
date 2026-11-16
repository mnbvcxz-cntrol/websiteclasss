@echo off
title Stitch Maison Local Server
echo ========================================================
echo Stitch Maison Luxury Boutique - Local Server
echo Serving at: http://localhost:8080/
echo Press Ctrl+C in this window to stop the server.
echo ========================================================
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0server.ps1"
pause
