# Política de Privacidad — Appstery

**Última actualización:** Abril 2026  
**Aplicación:** Appstery (com.appstery.app)  
**Repositorio:** https://github.com/luisitoys12/appstery

---

## 1. Quiénes somos

Appstery es una tienda de aplicaciones Android de código abierto, distribuida gratuitamente a través de GitHub Releases y F-Droid. No es una empresa registrada ni un servicio comercial. Es un proyecto de software libre bajo licencia GPL v3.

---

## 2. Principios fundamentales

- **No recopilamos datos personales** de identificación directa (nombre, email, teléfono).
- **No vendemos datos** a ningún tercero.
- **No mostramos publicidad personalizada** basada en tu comportamiento.
- **No rastreamos** tu actividad dentro de la app de forma encubierta.
- **El código es público** — cualquier persona puede auditar qué hace la app en https://github.com/luisitoys12/appstery

---

## 3. Datos que SÍ se procesan (técnicamente necesarios)

### 3.1 Descargas y actualizaciones
Cuando descargas una app desde Appstery, el servidor que aloja el APK puede registrar:
- Dirección IP (técnicamente inevitable en toda conexión HTTP)
- Fecha y hora de la descarga
- Nombre del archivo descargado

Estos datos **no se vinculan a tu identidad** y se usan únicamente para estadísticas agregadas de descargas.

### 3.2 Reportes de crash (opcionales)
Si el módulo de reportes de crash está activo, puede enviar:
- Traza del error (stack trace)
- Versión de Android y modelo de dispositivo (genérico)
- Versión de Appstery instalada

**No incluye** datos personales ni información de cuentas.

### 3.3 Cuenta de usuario (si aplica)
Si Appstery implementa cuentas de usuario en versiones futuras:
- El email o usuario es procesado únicamente para autenticación
- No se vende ni comparte con terceros
- Puedes solicitar eliminación en cualquier momento vía GitHub Issues

---

## 4. Permisos que solicita la app

| Permiso | Para qué se usa |
|---|---|
| `INTERNET` | Navegar el catálogo y descargar APKs |
| `WRITE_EXTERNAL_STORAGE` | Guardar APKs descargados (Android < 10) |
| `REQUEST_INSTALL_PACKAGES` | Instalar apps descargadas |
| `RECEIVE_BOOT_COMPLETED` | Reanudar descargas pendientes al reiniciar |

**No se solicitan permisos de:** cámara, micrófono, contactos, SMS, localización GPS.

---

## 5. Seguridad — VirusTotal y verificación de apps

Appstery se compromete a:

- **Escanear todos los APKs** del catálogo con VirusTotal antes de incluirlos.
- **Mostrar el resultado del escaneo** junto a cada app (enlace público a VirusTotal).
- **Rechazar apps** que presenten detecciones en más de 2/72 motores de VirusTotal.
- **Verificar firmas APK** para garantizar que el archivo no fue modificado.
- **No incluir** apps con permisos excesivos o comportamientos sospechosos.

> El propio APK de Appstery está disponible públicamente y puede ser verificado en:
> https://www.virustotal.com — pegar la URL del APK del Release

---

## 6. Apps de terceros

Appstery es un *catálogo* — las apps que distribuye son creadas por terceros.
Appstery **no se responsabiliza** del comportamiento interno de apps de terceros una vez instaladas en tu dispositivo. Revisa siempre los permisos antes de instalar.

---

## 7. Menores de edad

Appstery no está específicamente dirigido a menores de 13 años. No recopilamos intencionalmente datos de menores.

---

## 8. Cambios a esta política

Si la política cambia significativamente, se notificará mediante:
- Commit en el repositorio de GitHub
- Release notes en GitHub Releases

---

## 9. Contacto

- **GitHub Issues:** https://github.com/luisitoys12/appstery/issues
- **Repositorio:** https://github.com/luisitoys12/appstery

---

## 10. Código abierto = transparencia real

A diferencia de apps propietarias, el código completo de Appstery está disponible para auditoría pública. Esto es privacidad verificable, no solo declarada.
