# Configuración específica para Render

## Configuración del Servicio Web en Render

### Build & Deploy Settings:

```
Name: transcribe-audio-api
Environment: Python 3
Build Command: pip install -r requirements.txt
Start Command: python app.py
Instance Type: Standard (recomendado para modelo medium)
```

### Variables de Entorno:

```
FLASK_ENV=production
PORT=10000
PYTHON_VERSION=3.9.18
```

### Configuración Avanzada:

- Auto-Deploy: Yes
- Health Check Path: /health
- Region: Oregon (recomendado)

## Notas Importantes para Render:

1. **Primera carga**: El modelo Whisper medium (~769MB) se descargará en el primer deploy, esto puede tomar 5-10 minutos

2. **Tiempo de construcción**: El build inicial puede tomar 10-15 minutos debido a las dependencias de PyTorch

3. **Memoria**: El plan Standard de Render (1GB RAM) es suficiente para el modelo medium

4. **Timeout**: Para archivos grandes, Render tiene un timeout de 60 segundos por defecto. Para archivos muy largos, considera usar el modelo `small` en lugar de `medium`

5. **Storage**: Los archivos se procesan en memoria, no se almacenan permanentemente

## URLs después del deploy:

- API: https://tu-servicio.onrender.com
- Health check: https://tu-servicio.onrender.com/health
- Documentación: https://tu-servicio.onrender.com/

## Límites del Plan Gratuito de Render:

- ⚠️ El servicio se suspende después de 15 minutos de inactividad
- ⚠️ 750 horas de uso gratuito por mes
- ⚠️ Puede ser lento en el primer arranque (cold start)

Para uso en producción, considera el plan Standard ($7/mes) que incluye:

- ✅ Sin suspensión automática
- ✅ Mejor rendimiento
- ✅ SSL automático
- ✅ Dominios personalizados
