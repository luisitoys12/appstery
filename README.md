# 🧩 Appstery

> Tu tienda de apps Android — libre, abierta y distribuida sin hosting propio.

[![Build APK](https://github.com/luisitoys12/appstery/actions/workflows/build.yml/badge.svg)](https://github.com/luisitoys12/appstery/actions/workflows/build.yml)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](LICENSE)
[![F-Droid](https://img.shields.io/badge/F--Droid-compatible-green)](https://luisitoys12.github.io/appstery/fdroid/repo)

**Appstery** es una tienda de aplicaciones Android de código abierto, basada en el cliente Aptoide v8.
No necesita dominio propio ni hosting — se distribuye directamente desde GitHub y F-Droid.

---

## 📦 Instalar Appstery

### Opción 1 — GitHub Releases (APK directo)

1. Ve a [Releases](https://github.com/luisitoys12/appstery/releases)
2. Descarga el APK más reciente (`appstery-release.apk`)
3. En tu Android: **Ajustes → Seguridad → Instalar apps desconocidas** ✔️
4. Abre el APK descargado e instala

### Opción 2 — F-Droid (repositorio custom)

1. Instala [F-Droid](https://f-droid.org)
2. En F-Droid → **Ajustes → Repositorios → Agregar repositorio**
3. Pega esta URL:
   ```
   https://luisitoys12.github.io/appstery/fdroid/repo
   ```
4. Busca **Appstery** y actualiza

---

## 🛠 Estructura del proyecto

```
appstery/
├── app/                          # Módulo principal Android
├── appcoins/                     # Sistema de pagos (AppCoins)
├── aptoide-account-manager/      # Gestión de cuentas
├── aptoide-analytics-core/       # Analíticas (core)
├── aptoide-authentication-core/  # Autenticación
├── aptoide-database/             # Base de datos local (Room)
├── aptoide-views/                # Componentes UI custom
├── dataprovider/                 # Capa de datos / API
├── downloadmanager/              # Gestor de descargas APK
├── packageinstaller/             # Instalador de paquetes
├── utils/                        # Utilidades generales
├── crashreports/                 # Reportes de crash
└── .github/workflows/            # CI/CD con GitHub Actions
```

---

## 🔧 Compilar desde el código fuente

### Requisitos

- **Java 17+**
- **Android SDK** (API 21 mínimo, API 34 target)
- **Gradle 8+**

### Pasos

```bash
# Clonar el repo
git clone https://github.com/luisitoys12/appstery.git
cd appstery

# Compilar APK debug
./gradlew assembleDebug

# Compilar APK release (requiere keystore)
./gradlew assembleRelease
```

El APK se genera en: `app/build/outputs/apk/`

---

## ⚙️ GitHub Actions (CI/CD)

Cada push a `main` compila automáticamente el APK y lo adjunta como artefacto.
Cada tag `v*.*.*` crea un **Release** con el APK publicado automáticamente.

Ver workflows en [`.github/workflows/`](.github/workflows/)

---

## 🗺 Roadmap

- [x] Fork y rebrand base (Aptoide v8 → Appstery)
- [x] GitHub Actions para compilar APK automáticamente
- [x] Distribución vía GitHub Releases
- [ ] Repositorio F-Droid en GitHub Pages
- [ ] Cambiar package name a `com.appstery.app`
- [ ] Reemplazar endpoints API por backend propio o F-Droid API
- [ ] Nuevo diseño visual (icono, splash, colores)
- [ ] Soporte SRT/RTMP para catálogo de media apps
- [ ] App web companion (GitHub Pages)

---

## 🤝 Contribuir

1. Haz fork del repo
2. Crea tu rama: `git checkout -b feature/mi-feature`
3. Commit: `git commit -m 'feat: agrega X'`
4. Push: `git push origin feature/mi-feature`
5. Abre un Pull Request

Para traducciones, se usará Crowdin. Ver [`crowdin.yml`](crowdin.yml).

---

## 📄 Licencia

Distribuido bajo la licencia **GNU GPL v3**. Ver [`LICENSE`](LICENSE) para más detalles.

---

<p align="center">
  <sub>Hecho con ❤️ — sin dominio, sin hosting, puro open source.</sub>
</p>
