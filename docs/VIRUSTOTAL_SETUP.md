# Configurar VirusTotal en GitHub Actions

## 1. Obtener API Key gratuita

1. Ir a https://www.virustotal.com
2. Crear cuenta gratuita
3. Perfil -> **API Key** -> copiar

> Cuota gratuita: **4 req/minuto**, **500 req/dia** — suficiente para CI/CD open source.

---

## 2. Agregar Secret en el repo

1. https://github.com/luisitoys12/appstery -> **Settings**
2. **Secrets and variables -> Actions**
3. **New repository secret**
   - Nombre: `VT_API_KEY`
   - Valor: tu API Key
4. Guardar

---

## 3. Flujo automatico

```
Push a main
  L-> Compilar APK Debug
        L-> Escanear con VirusTotal
              L-> Aprobado: build verde
              L-> 3+ detecciones: build falla

Crear Release (tag v1.0.0)
  L-> Compilar APK Release
        L-> Escanear con VirusTotal
              L-> Aprobado:
                    L-> Publicar APK en el Release
                    L-> Enlace VT agregado al body del Release
              L-> 3+ detecciones: Release cancelado
```

---

## 4. Escaneo manual

Actions -> **VirusTotal Manual Scan** -> Run workflow
- Ingresar tag del release (ej: `v1.0.0`) o URL del APK
- Ver reporte detallado en los logs

---

## 5. Sin API Key

Si no configuras `VT_API_KEY`, los jobs de VT se omiten automaticamente.
El build y release siguen funcionando sin escaneo.

---

## 6. Resultado visible en cada Release

Con `update_release_body: true`, cada Release publicado incluye automaticamente:

```markdown
## VirusTotal Analysis
- appstery-v1.0.0.apk: https://www.virustotal.com/gui/file/...
```

Los usuarios pueden verificar el escaneo directamente desde la pagina del Release en GitHub.
