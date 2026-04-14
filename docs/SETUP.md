# Guía de Configuración — Appstery

Esta guía explica cómo configurar el entorno de desarrollo para Appstery.

---

## Requisitos previos

| Herramienta | Versión mínima | Instalar |
|---|---|---|
| Java (JDK) | 17 | [adoptium.net](https://adoptium.net) |
| Android Studio | 2023.x+ | [developer.android.com](https://developer.android.com/studio) |
| Android SDK | API 21+ | Desde Android Studio |
| Gradle | 8.x (wrapper incluido) | Automático con `./gradlew` |

---

## Clonar y configurar

```bash
# 1. Clonar
git clone https://github.com/luisitoys12/appstery.git
cd appstery

# 2. Abrir en Android Studio
# File → Open → selecciona la carpeta appstery/

# 3. Compilar desde terminal
./gradlew assembleDebug
```

---

## Variables de entorno (local.properties)

Crea un archivo `local.properties` en la raíz con:

```properties
# Ruta al Android SDK
sdk.dir=/Users/TU_USUARIO/Library/Android/sdk

# (Linux)
# sdk.dir=/home/TU_USUARIO/Android/Sdk

# (Windows)
# sdk.dir=C\:\\Users\\TU_USUARIO\\AppData\\Local\\Android\\Sdk
```

> ⚠️ `local.properties` está en `.gitignore` — nunca lo subas al repo.

---

## Build variants

| Variant | Descripción |
|---|---|
| `debug` | Desarrollo, con logs, sin ofuscar |
| `release` | Producción, con ProGuard, requiere keystore |

```bash
# Debug (sin keystore)
./gradlew assembleDebug

# Release (necesita keystore configurado)
./gradlew assembleRelease
```

---

## Pendiente — Rebrand técnico

Estos cambios aún están en progreso:

- [ ] Cambiar `applicationId` de `cm.aptoide.pt` a `com.appstery.app` en `app/build.gradle`
- [ ] Renombrar packages Java/Kotlin de `cm.aptoide` a `com.appstery`
- [ ] Nuevo icono de launcher (reemplazar assets en `app/src/main/res/`)
- [ ] Nuevo splash screen con branding Appstery
- [ ] Actualizar `strings.xml` (nombre de app, URLs)
- [ ] Apuntar `dataprovider` a API propia o F-Droid

---

## Distribución

### GitHub Releases

Cada tag `v*.*.*` dispara el workflow `build.yml` que publica el APK automáticamente.

```bash
git tag v1.0.0
git push origin v1.0.0
```

### F-Droid

El repositorio F-Droid custom vive en la rama `gh-pages`:
```
https://luisitoys12.github.io/appstery/fdroid/repo
```

Se actualiza automáticamente con el workflow `fdroid.yml` en cada release.
