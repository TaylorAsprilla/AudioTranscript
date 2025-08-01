# 🎙️ AudioTranscript - API de Transcripción de Audio

Una API REST desarrollada en Flask que permite transcribir archivos de audio en español y convertirlos a documentos PDF o DOCX utilizando OpenAI Whisper.

## ✨ Características

- **Transcripción optimizada para español** con modelo Whisper Medium
- **Múltiples formatos de audio** (MP3, WAV, FLAC, M4A, AAC, OGG, WMA, MP4, AVI, MOV, MKV, WEBM)
- **Generación de PDF y DOCX** con metadatos profesionales
- **Archivos grandes** - Soporte hasta 1GB
- **Interfaz web moderna** con drag & drop
- **API REST completa** fácil de integrar

## 📁 Estructura Optimizada

```
transcribeAudio/
├── 🐍 app.py               # API Flask principal con CORS
├── 🌐 index.html           # Interfaz web profesional
├── 🧪 test_client.html     # Cliente alternativo para testing
├── 📦 requirements.txt     # Dependencias optimizadas
├── 📖 README.md            # Documentación completa
├── 🚀 Procfile             # Configuración para Render
├── 🐍 runtime.txt          # Python 3.11.8 para Render
├── 🔧 start.bat/start.sh   # Scripts de desarrollo local
├── ⚙️ .gitignore           # Configuración Git
├── 📁 uploads/             # Temporal (se limpia automáticamente)
├── 📁 outputs/             # Temporal (se limpia automáticamente)
├── 🐍 venv/                # Entorno virtual para desarrollo
└── 📂 .git/                # Control de versiones
```

## 🚀 Uso Rápido

### **Desarrollo Local**

**Windows:**

```bash
start.bat
```

**Linux/Mac:**

```bash
chmod +x start.sh
./start.sh
```

**Manual:**

```bash
pip install -r requirements.txt
python app.py
```

### **Acceso Web**

- **Interfaz principal**: `http://localhost:5000`
- **Cliente de testing**: Abrir `test_client.html` en el navegador

## ☁️ Deploy en Render

### **Configuración automática:**

1. Conecta tu repositorio a Render
2. Render detectará automáticamente:
   - `Procfile` → Comando de inicio
   - `requirements.txt` → Dependencias
   - `runtime.txt` → Python 3.11.8

### **Variables de entorno (opcionales):**

- `FLASK_ENV=production` (automático en Render)
- `PORT` (automático en Render)

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

## 🔌 API Endpoints

### **GET /**

Página principal con interfaz web

```bash
http://localhost:5000/
```

### **GET /health**

Estado de la API y modelo

```bash
curl http://localhost:5000/health
```

**Respuesta:**

```json
{
  "status": "OK",
  "model": "medium",
  "model_loaded": true,
  "language": "Spanish",
  "max_file_size": "1GB",
  "supported_formats": ["mp3", "wav", "flac", ...]
}
```

### **POST /transcribe**

Transcribir archivo de audio

**Parámetros:**

- `audio` (archivo): Archivo de audio/video
- `format` (opcional): `pdf` o `docx` (default: `pdf`)

**Ejemplo cURL:**

```bash
# Transcribir a PDF
curl -X POST \
  -F "audio=@mi_audio.mp3" \
  -F "format=pdf" \
  http://localhost:5000/transcribe \
  --output transcripcion.pdf

# Transcribir a DOCX
curl -X POST \
  -F "audio=@mi_audio.mp3" \
  -F "format=docx" \
  http://localhost:5000/transcribe \
  --output transcripcion.docx
```

**Respuesta exitosa:**

- Archivo PDF/DOCX listo para descarga
- Headers con nombre del archivo y tipo de contenido

## 🌐 Interfaz Web

### **Interfaz Principal** (`http://localhost:5000`)

- ✅ Drag & drop de archivos
- ✅ Validación automática de formatos
- ✅ Barra de progreso en tiempo real
- ✅ Descarga automática
- ✅ Estado de conexión con la API

### **Cliente de Testing** (`test_client.html`)

- ✅ Testing rápido de la API
- ✅ Información detallada de respuestas
- ✅ Modo desarrollador

## 📋 Formatos Soportados

### **Audio:**

MP3, WAV, FLAC, M4A, AAC, OGG, WMA

### **Video:**

MP4, AVI, MOV, MKV, WEBM (extrae audio automáticamente)

### **Salida:**

PDF (profesional) | DOCX (editable)

## ⚙️ Configuración Técnica

### **Modelo Whisper**

- **Modelo**: `medium` (769 MB)
- **Idioma**: Español optimizado
- **Precisión**: Excelente para español

### **Límites**

- **Tamaño máximo**: 1GB por archivo
- **Tiempo de procesamiento**: ~1-3 min por hora de audio
- **Formatos automáticos**: Conversión automática con FFmpeg

## 🔧 Troubleshooting

### **Problemas Comunes**

**❌ "FFmpeg no encontrado"**

```bash
# Windows
winget install ffmpeg
# Reiniciar terminal después de instalar

# Mac
brew install ffmpeg

# Linux
sudo apt install ffmpeg
```

**❌ "API desconectada" en navegador**

- Verificar que `python app.py` esté ejecutándose
- Comprobar que no hay otro proceso en puerto 5000
- Revisar firewall/antivirus

**❌ "Modelo no cargado"**

- Esperar a que termine de descargar (~769 MB primera vez)
- Verificar conexión a internet
- Reiniciar la aplicación

**❌ Error de memoria**

- Archivos muy grandes: dividir el audio
- Cerrar otras aplicaciones pesadas
- Usar modelo `base` en lugar de `medium`

## 📞 Soporte

- **🌐 Website**: [taylorasprilla.dev](https://taylorasprilla.dev)
- **📧 Email**: taylor.asprilla@gmail.com
- **📦 GitHub**: [AudioTranscript](https://github.com/TaylorAsprilla/AudioTranscript)

---

## 🎉 ¡Proyecto listo para usar!

**Desarrollo local**: `start.bat` o `./start.sh`
**Deploy**: Push a Render
**Interfaz**: `http://localhost:5000`

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
