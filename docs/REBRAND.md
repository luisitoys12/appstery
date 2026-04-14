# Plan de Rebrand — Aptoide → Appstery

Este documento guía el proceso de renombrar y adaptar el código base de Aptoide v8 a Appstery.

---

## 1. Cambiar el Application ID

En `app/build.gradle`, localizar y cambiar:

```groovy
// ANTES
applicationId "cm.aptoide.pt"

// DESPUÉS
applicationId "com.appstery.app"
```

---

## 2. Renombrar packages Java

En Android Studio:
1. Click derecho en el package `cm.aptoide.pt` → **Refactor → Rename**
2. Cambiar a `com.appstery.app`
3. Hacer lo mismo para subpackages: `cm.aptoide.analytics` → `com.appstery.analytics`, etc.

Desde terminal (búsqueda rápida):

```bash
# Ver todos los archivos con el package antiguo
grep -r "cm.aptoide" --include="*.java" --include="*.kt" --include="*.xml" -l

# Reemplazar en masa (macOS/Linux)
find . -type f \( -name "*.java" -o -name "*.kt" -o -name "*.xml" \) \
  -exec sed -i '' 's/cm\.aptoide/com.appstery/g' {} +

# Linux (sin la comilla vacía)
find . -type f \( -name "*.java" -o -name "*.kt" -o -name "*.xml" \) \
  -exec sed -i 's/cm\.aptoide/com.appstery/g' {} +
```

---

## 3. Actualizar strings.xml

En `app/src/main/res/values/strings.xml` (y todas las variantes de idioma):

```xml
<!-- ANTES -->
<string name="app_name">Aptoide</string>

<!-- DESPUÉS -->
<string name="app_name">Appstery</string>
```

---

## 4. Nuevo icono

Reemplazar en `app/src/main/res/`:
- `mipmap-hdpi/ic_launcher.png`
- `mipmap-mdpi/ic_launcher.png`
- `mipmap-xhdpi/ic_launcher.png`
- `mipmap-xxhdpi/ic_launcher.png`
- `mipmap-xxxhdpi/ic_launcher.png`

También actualizar `ic_launcher_round` si existe.

---

## 5. Endpoints API

En `dataprovider/`, localizar las URLs base de Aptoide y reemplazarlas:

```java
// ANTES
private static final String BASE_URL = "https://webservices.aptoide.com/";

// DESPUÉS (opciones)
// Opción A: API propia
private static final String BASE_URL = "https://api.appstery.app/"; // futuro

// Opción B: API de F-Droid pública
private static final String BASE_URL = "https://f-droid.org/api/v1/";
```

---

## 6. Decidir sobre AppCoins

El módulo `appcoins/` es el sistema de micro-pagos de Aptoide.

- **Mantener:** Si planeas monetización con criptomonedas (AppCoins/APPC)
- **Eliminar:** Quitar el módulo de `settings.gradle` y sus referencias en `app/build.gradle`
- **Reemplazar:** Por Stripe, PayPal u otro sistema propio

---

## Estado actual del rebrand

| Tarea | Estado |
|---|---|
| Fork y renombre del repo | ✅ Hecho |
| README con branding Appstery | ✅ Hecho |
| GitHub Actions (CI/CD) | ✅ Hecho |
| Templates de issues y PR | ✅ Hecho |
| Cambiar applicationId | ⏳ Pendiente |
| Renombrar packages | ⏳ Pendiente |
| Nuevo icono/splash | ⏳ Pendiente |
| Actualizar strings.xml | ⏳ Pendiente |
| Reemplazar endpoints API | ⏳ Pendiente |
| Repositorio F-Droid activo | ⏳ Pendiente |
