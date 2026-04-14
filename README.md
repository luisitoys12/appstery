# Appstery

> Tu tienda de apps Android 100% libre. Sin Google Play. Sin tracking. Sin cuenta.

[![Build · Scan · Release](https://github.com/luisitoys12/appstery/actions/workflows/build-scan-release.yml/badge.svg)](https://github.com/luisitoys12/appstery/actions/workflows/build-scan-release.yml)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-teal.svg)](LICENSE)
[![F-Droid](https://img.shields.io/badge/F--Droid-available-green)](https://luisitoys12.github.io/appstery/fdroid/repo)

## ¿Qué es Appstery?

Appstery es un fork de [Aptoide v8](https://github.com/Aptoide/aptoide-client-v8) re-brandizado como tienda de apps libre, sin ads, sin AppCoins y sin dependencia de Google Play. Se distribuye exclusivamente vía GitHub Releases y F-Droid.

## Instalar

### Opción 1 — F-Droid (recomendado)

1. Abre F-Droid → Settings → Repositories → `+`
2. Agrega: `https://luisitoys12.github.io/appstery/fdroid/repo`
3. Busca **Appstery** e instala

### Opción 2 — APK directo

Descarga el APK desde [Releases](https://github.com/luisitoys12/appstery/releases/latest).

## Catálogo web

Visita [luisitoys12.github.io/appstery](https://luisitoys12.github.io/appstery) para explorar el catálogo.

## Compilar desde fuente

```bash
git clone https://github.com/luisitoys12/appstery.git
cd appstery
# Configura gradle.properties con tus keys de firma (ver SECRETS_SETUP.md)
./gradlew assembleVanillaProdRelease
```

## Configurar secrets

Ver [`docs/SECRETS_SETUP.md`](docs/SECRETS_SETUP.md) para instrucciones completas.

## Estructura

```
appstery/
├── app/                    ← Módulo principal Android
├── dataprovider/           ← API → redirigido a F-Droid / backend propio
├── downloadmanager/        ← Gestor de descargas APK
├── packageinstaller/       ← Instalador de paquetes
├── aptoide-views/          ← Componentes visuales
├── docs/                   ← GitHub Pages (catálogo web + F-Droid repo)
│   ├── index.html          ← App web companion
│   └── fdroid/repo/        ← Índice F-Droid
└── .github/workflows/      ← CI/CD: build · scan · release · fdroid
```

## Licencia

GPL-3.0 — fork de Aptoide v8. Ver [LICENSE](LICENSE).

---

> Package: `com.appstery.app` · built with ❤️ from Irapuato, Guanajuato, MX
