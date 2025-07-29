# API de Transcripción de Audio a PDF - Optimizada para Español

Una API REST desarrollada en Flask que permite transcribir archivos de audio en español y convertirlos a documentos PDF o DOCX utilizando OpenAI Whisper.

## Características

- ✅ Transcripción de audio usando OpenAI Whisper optimizada para español
- ✅ Soporte para múltiples formatos de audio (MP3, WAV, FLAC, M4A, AAC, OGG, WMA, MP4, AVI, MOV, MKV, WEBM)
- ✅ Generación de documentos PDF y DOCX
- ✅ Idioma configurado: Español 🇪🇸
- ✅ Soporte para archivos de hasta 1GB
- ✅ API REST fácil de usar
- ✅ Metadatos incluidos en los documentos generados
- ✅ Manejo de errores robusto

## 📁 Estructura del Proyecto (Simplificada)

```
transcribeAudio/
├── 🐍 app.py                 # Aplicación Flask principal
├── 📦 requirements.txt       # Dependencias de Python
├── 🌐 test_client.html       # Cliente web para transcripciones
├── 📖 README.md              # Documentación del proyecto
├── 🚀 start.bat/.sh          # Scripts de inicio
├── 📁 uploads/               # Archivos temporales (se limpian automáticamente)
├── 📄 outputs/               # PDFs generados (se descargan al usuario)
└── 🐍 venv/                  # Entorno virtual de Python
```

## 🎯 Archivos Principales

- **`app.py`**: Aplicación principal con la API Flask
- **`test_client.html`**: Interfaz web para usar la API
- **`requirements.txt`**: Lista de dependencias necesarias
- **`start.bat`/`start.sh`**: Scripts para iniciar la aplicación fácilmente

## Instalación

### Prerrequisitos

- Python 3.8 o superior
- pip
- FFmpeg (se instala automáticamente)

### Instalación Automática (Recomendado)

La forma más fácil es usar uno de los scripts de inicio que configuran todo automáticamente:

**Para Windows:**

- **setup_and_run.bat** - Para Command Prompt
- **start_api.ps1** - Para PowerShell
- **start_api.sh** - Para Git Bash/WSL

```bash
# Doble clic en cualquiera de estos archivos
setup_and_run.bat      # Command Prompt
start_api.ps1          # PowerShell (requiere Set-ExecutionPolicy RemoteSigned)
start_api.sh          # Git Bash/WSL
```

### Instalación Manual

1. **Clonar o descargar el proyecto**

```bash
cd transcribeAudio
```

2. **Crear entorno virtual (recomendado)**

```bash
python -m venv venv
```

3. **Activar entorno virtual**

   - Windows:

   ```bash
   source venv/Scripts/activate
   ```

   - Linux/Mac:

   ```bash
   source venv/bin/activate
   ```

4. **Instalar dependencias**

```bash
pip install -r requirements.txt
```

5. **Instalar FFmpeg** (requerido para procesamiento de audio):

   ```bash
   # En Windows con winget
   winget install --id=Gyan.FFmpeg -e
   ```

   **⚠️ IMPORTANTE**: Después de instalar FFmpeg, **debe reiniciar el terminal** para que esté disponible en el PATH.

## Uso

### Iniciar la API

**Opción 1: Scripts automáticos (Recomendado)**

- Doble clic en `setup_and_run.bat`, `start_api.ps1` o `start_api.sh`

**Opción 2: Manualmente**

```bash
python app.py
```

La API estará disponible en: `http://localhost:5000`

### Endpoints disponibles

#### GET `/`

Información general de la API

```bash
curl http://localhost:5000/
```

#### GET `/health`

Verificar estado de la API

```bash
curl http://localhost:5000/health
```

#### POST `/transcribe`

Transcribir archivo de audio

**Parámetros:**

- `audio` (archivo): Archivo de audio a transcribir
- `format` (opcional): Formato de salida (`pdf` o `docx`, por defecto `pdf`)

**Ejemplos:**

```bash
# Transcribir a PDF
curl -X POST -F "audio=@mi_audio.mp3" http://localhost:5000/transcribe --output transcripcion.pdf

# Transcribir a DOCX
curl -X POST -F "audio=@mi_audio.wav" -F "format=docx" http://localhost:5000/transcribe --output transcripcion.docx
```

### Usando Python requests

```python
import requests

# Transcribir archivo de audio
with open('mi_audio.mp3', 'rb') as audio_file:
    files = {'audio': audio_file}
    data = {'format': 'pdf'}  # o 'docx'

    response = requests.post('http://localhost:5000/transcribe', files=files, data=data)

    if response.status_code == 200:
        with open('transcripcion.pdf', 'wb') as f:
            f.write(response.content)
        print("Transcripción completada!")
    else:
        print(f"Error: {response.json()}")
```

### Usando formulario HTML

```html
<!DOCTYPE html>
<html>
  <head>
    <title>Transcripción de Audio</title>
  </head>
  <body>
    <h1>Transcribir Audio a PDF</h1>
    <form
      action="http://localhost:5000/transcribe"
      method="post"
      enctype="multipart/form-data"
    >
      <label for="audio">Seleccionar archivo de audio:</label><br />
      <input
        type="file"
        id="audio"
        name="audio"
        accept="audio/*,video/*"
        required
      /><br /><br />

      <label for="format">Formato de salida:</label><br />
      <select id="format" name="format">
        <option value="pdf">PDF</option>
        <option value="docx">DOCX</option></select
      ><br /><br />

      <input type="submit" value="Transcribir" />
    </form>
  </body>
</html>
```

## Formatos de Audio Soportados

- **Audio:** MP3, WAV, FLAC, M4A, AAC, OGG, WMA
- **Video:** MP4, AVI, MOV, MKV, WEBM (se extrae el audio)

## Configuración

### Modelo Whisper

Por defecto se usa el modelo `base`. Puedes cambiar a otros modelos editando la línea en `app.py`:

```python
model = whisper.load_model("base")  # Opciones: tiny, base, small, medium, large
```

**Modelos disponibles:**

- `tiny`: Más rápido, menos preciso (~39 MB)
- `base`: Balance entre velocidad y precisión (~74 MB)
- `small`: Mejor precisión, más lento (~244 MB)
- `medium`: Excelente precisión, considerablemente más lento (~769 MB) ⭐ **ACTUAL**
- `large`: Máxima precisión, muy lento (~1550 MB)

## 🚀 Despliegue en Render

### Guía Paso a Paso para Render

#### 1. **Preparar Repositorio en GitHub**

```bash
# 1. Sube tu código a GitHub
git init
git add .
git commit -m "API de transcripción lista para Render"
git branch -M main
git remote add origin https://github.com/tu-usuario/transcribe-audio-api.git
git push -u origin main
```

#### 2. **Configurar en Render**

1. Ve a [render.com](https://render.com) y crea una cuenta
2. Haz clic en "New +" → "Web Service"
3. Conecta tu repositorio de GitHub
4. Configura los siguientes valores:

**Configuración de Build & Deploy:**

- **Name**: `transcribe-audio-api`
- **Environment**: `Python 3`
- **Build Command**: `pip install -r requirements.txt`
- **Start Command**: `python app.py`
- **Instance Type**: `Standard` (recomendado para modelo medium)

#### 3. **Variables de Entorno en Render**

En la sección "Environment Variables" de Render, agrega:

```bash
FLASK_ENV=production
PORT=10000
PYTHON_VERSION=3.9.18
```

#### 4. **Configuración Avanzada**

- **Auto-Deploy**: `Yes` (para actualizaciones automáticas)
- **Health Check Path**: `/health`
- **Region**: `Oregon` (recomendado para latencia)

### ⚠️ Consideraciones Importantes para Render

**Plan Gratuito:**

- ✅ 750 horas gratis por mes
- ⚠️ Se suspende después de 15 min de inactividad (cold start)
- ⚠️ Primera carga del modelo Whisper puede tomar 5-10 minutos

**Plan Standard ($7/mes) - Recomendado para producción:**

- ✅ Sin suspensión automática
- ✅ Mejor rendimiento
- ✅ SSL automático

### 🔧 Solución de Problemas en Render

**Build Time Out:**

```bash
# Si el build toma más de 15 minutos, considera cambiar a modelo 'small'
# En app.py línea 87, cambiar:
model = whisper.load_model("small")  # En lugar de "medium"
```

**Memory Issues:**

```bash
# Upgrade a Standard plan o usar modelo más pequeño
```

**URL de tu API después del deploy:**

```
https://tu-servicio-nombre.onrender.com
```

## Estructura del Proyecto

```
transcribeAudio/
├── app.py              # Aplicación principal
├── requirements.txt    # Dependencias
├── README.md          # Este archivo
├── uploads/           # Archivos temporales (se crea automáticamente)
└── outputs/           # Archivos generados (se crea automáticamente)
```

## Respuestas de la API

### Éxito (200)

Retorna el archivo PDF o DOCX directamente como descarga.

### Errores

**400 - Bad Request**

```json
{
  "error": "Descripción del error"
}
```

**413 - Payload Too Large**

```json
{
  "error": "Archivo demasiado grande. Máximo permitido: 1GB"
}
```

**500 - Internal Server Error**

```json
{
  "error": "Error interno del servidor: descripción"
}
```

## Características del Documento Generado

Los documentos PDF y DOCX incluyen:

- Título: "Transcripción de Audio"
- Metadatos:
  - Fecha y hora de transcripción
  - Nombre del archivo original
  - Duración del audio (cuando está disponible)
- Texto transcrito formateado en párrafos

## Rendimiento y Consideraciones

- **Primera ejecución:** Puede tardar más tiempo debido a la descarga del modelo Whisper
- **Archivos grandes:** La transcripción puede tomar varios minutos dependiendo del tamaño
- **Memoria:** El modelo base requiere aproximadamente 1GB de RAM
- **CPU vs GPU:** Whisper puede usar GPU para acelerar la transcripción si está disponible

## Solución de Problemas

### Error: "No module named 'whisper'"

```bash
pip install openai-whisper
```

### Error: "torch not found"

```bash
pip install torch torchvision torchaudio
```

### Error de memoria

- Usar un modelo más pequeño (`tiny` en lugar de `base`)
- Procesar archivos más pequeños
- Aumentar la memoria del sistema

### El audio no se transcribe

- Verificar que el archivo contenga speech
- Verificar el formato del archivo
- Probar con otro archivo de audio

## Desarrollo

Para contribuir al proyecto:

1. Fork el repositorio
2. Crear una rama para tu feature: `git checkout -b feature/nueva-caracteristica`
3. Commit tus cambios: `git commit -am 'Agregar nueva característica'`
4. Push a la rama: `git push origin feature/nueva-caracteristica`
5. Crear un Pull Request

## Licencia

Este proyecto está bajo la Licencia MIT.

## Soporte

Para reportar bugs o solicitar features, por favor crear un issue en el repositorio del proyecto.
