@echo off
REM Script para iniciar la API de Transcripción en Windows

echo 🎵 Iniciando API de Transcripción de Audio a PDF
echo ================================================
echo.
echo 📍 Directorio: %CD%
python --version 2>nul && echo 🐍 Python: && python --version || echo ❌ Python no encontrado
echo.
echo 🚀 Iniciando servidor en http://localhost:5000
echo 💡 Presiona Ctrl+C para detener
echo.

python app.py

pause
