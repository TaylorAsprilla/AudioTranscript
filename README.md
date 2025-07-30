# API de Transcripción de Audio a PDF

Una API REST desarrollada en Flask que permite transcribir archivos de audio en español y convertirlos a documentos PDF o DOCX utilizando OpenAI Whisper.

## Características

- Transcripción de audio usando OpenAI Whisper optimizada para español
- Soporte para múltiples formatos de audio (MP3, WAV, FLAC, M4A, AAC, OGG, WMA, MP4, AVI, MOV, MKV, WEBM)
- Generación de documentos PDF y DOCX
- Idioma configurado: Español 🇪🇸
- Soporte para archivos de hasta 1GB
- API REST fácil de usar

## Estructura del Proyecto

```
transcribeAudio/
├── app.py                 # Aplicación Flask principal
├── requirements.txt       # Dependencias de Python
├── test_client.html       # Cliente web para transcripciones
├── README.md              # Documentación del proyecto
├── start.bat/.sh          # Scripts de inicio
├── uploads/               # Archivos temporales (se limpian automáticamente)
├── outputs/               # PDFs generados (se descargan al usuario)
└── venv/                  # Entorno virtual de Python
```

## Archivos Principales

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

   **IMPORTANTE**: Después de instalar FFmpeg, **debe reiniciar el terminal** para que esté disponible en el PATH.

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
- `medium`: Excelente precisión, considerablemente más lento (~769 MB) **ACTUAL**
- `large`: Máxima precisión, muy lento (~1550 MB)

## Licencia

Este proyecto está bajo la Licencia MIT.

## Soporte

Para reportar bugs o solicitar features, por favor crear un issue en el repositorio del proyecto.
