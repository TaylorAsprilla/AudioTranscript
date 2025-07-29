@echo off
echo 🚀 Preparando proyecto para Render...

REM Verificar que estamos en el directorio correcto
if not exist "app.py" (
    echo ❌ Error: app.py no encontrado. Ejecuta este script desde el directorio del proyecto.
    pause
    exit /b 1
)

echo ✅ Estructura del proyecto verificada

REM Verificar archivos necesarios para Render
set files=app.py requirements.txt Procfile runtime.txt
for %%f in (%files%) do (
    if exist "%%f" (
        echo ✅ %%f encontrado
    ) else (
        echo ❌ %%f no encontrado
        pause
        exit /b 1
    )
)

echo.
echo 🎯 Archivos listos para Render:
echo    - app.py (aplicación principal)
echo    - requirements.txt (dependencias)
echo    - Procfile (comando de inicio)
echo    - runtime.txt (versión de Python)
echo    - RENDER_DEPLOY.md (instrucciones)
echo.

echo 📋 Próximos pasos:
echo 1. Sube el código a GitHub:
echo    git init
echo    git add .
echo    git commit -m "API lista para Render"
echo    git branch -M main
echo    git remote add origin https://github.com/tu-usuario/transcribe-audio-api.git
echo    git push -u origin main
echo.
echo 2. Ve a render.com y crea un nuevo Web Service
echo 3. Conecta tu repositorio de GitHub
echo 4. Usa la configuración de RENDER_DEPLOY.md
echo.
echo ✨ ¡Tu API estará lista en Render!
echo.
pause
