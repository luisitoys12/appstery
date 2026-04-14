# Política de Seguridad VirusTotal — Appstery

Appstery toma la seguridad en serio. Esta política describe cómo verificamos que las apps del catálogo estén libres de malware.

---

## Proceso de verificación

Antes de incluir cualquier APK en el catálogo de Appstery:

### Paso 1 — Escaneo con VirusTotal

1. Subir el APK a https://www.virustotal.com
2. Esperar el análisis completo (72+ motores antivirus)
3. Guardar la URL pública del reporte

### Paso 2 — Criterios de aceptación

| Resultado | Acción |
|---|---|
| 0 detecciones | ✅ Aprobado |
| 1-2 detecciones (falsos positivos conocidos) | ⚠️ Revisión manual |
| 3+ detecciones | ❌ Rechazado |

### Paso 3 — Verificación de firma APK

```bash
# Verificar que el APK tiene firma válida
apksigner verify --print-certs app.apk

# Comprobar que la firma coincide con versiones anteriores
apksigner verify --print-certs --verbose app.apk
```

### Paso 4 — Análisis de permisos

Usar `aapt` para listar permisos antes de aprobar:

```bash
aapt dump permissions app.apk
```

Permisos que disparan revisión manual:
- `READ_CONTACTS`, `WRITE_CONTACTS`
- `ACCESS_FINE_LOCATION`, `ACCESS_BACKGROUND_LOCATION`
- `READ_SMS`, `SEND_SMS`, `RECEIVE_SMS`
- `CAMERA`, `RECORD_AUDIO` (si la app no los necesita)
- `READ_CALL_LOG`, `WRITE_CALL_LOG`
- `BIND_DEVICE_ADMIN`
- `INSTALL_PACKAGES` (solo Appstery misma puede tener este)

---

## Cómo reportar un APK sospechoso

Si encuentras una app en el catálogo que crees que es maliciosa:

1. Abre un Issue en: https://github.com/luisitoys12/appstery/issues
2. Usa la etiqueta `security`
3. Incluye: nombre de la app, versión, URL del APK, resultado de VirusTotal

Las reportes de seguridad se atienden en **menos de 48 horas**.

---

## Verificar el APK de Appstery mismo

El propio instalador de Appstery puede verificarse en VirusTotal:

1. Ve a https://github.com/luisitoys12/appstery/releases
2. Copia la URL del APK
3. En VirusTotal → **URL** → pega la URL

O descarga el APK y súbelo directamente a VirusTotal.

---

## Automatización futura

Se planea integrar VirusTotal API en el workflow de GitHub Actions para escanear automáticamente cada APK antes del release.

```yaml
# Futuro paso en build.yml
- name: Escanear APK con VirusTotal
  uses: crazy-max/ghaction-virustotal@v4
  with:
    vt_api_key: ${{ secrets.VT_API_KEY }}
    files: app/build/outputs/apk/release/*.apk
```
