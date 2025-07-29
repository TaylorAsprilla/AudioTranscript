#!/bin/bash
# Script simple para iniciar la API de Transcripción

echo "🎵 Iniciando API de Transcripción de Audio a PDF"
echo "================================================"
echo ""
echo "📍 Directorio: $(pwd)"
echo "🐍 Python: $(python --version 2>&1)"
echo ""
echo "🚀 Iniciando servidor en http://localhost:5000"
echo "💡 Presiona Ctrl+C para detener"
echo ""

python app.py
