# Configurar Secrets para GitHub Actions

Ve a tu repo → **Settings → Secrets and variables → Actions → New repository secret**

## Secrets requeridos

| Secret | Descripción |
|--------|-------------|
| `KEYSTORE_B64` | Keystore en base64: `base64 -w0 appstery.keystore` |
| `KEYSTORE_PASSWORD` | Password del keystore |
| `KEY_PASSWORD` | Password de la key (puede ser el mismo) |
| `FDROID_KEYSTORE_B64` | Keystore para firmar índice F-Droid (puede ser el mismo) |
| `FDROID_KEYSTORE_PASS` | Password keystore F-Droid |
| `FDROID_KEY_PASS` | Password key F-Droid |

## Crear el keystore (solo una vez)

```bash
keytool -genkey -v \
  -keystore appstery.keystore \
  -alias appstery \
  -keyalg RSA \
  -keysize 4096 \
  -validity 10000 \
  -storepass TU_PASSWORD \
  -keypass TU_PASSWORD \
  -dname "CN=Appstery, OU=Dev, O=Appstery, L=Irapuato, S=Guanajuato, C=MX"

# Convertir a base64 para el secret:
base64 -w0 appstery.keystore
```

> ⚠️ El archivo `.keystore` está en `.gitignore`. NUNCA lo subas al repo.

## Activar GitHub Pages

1. Settings → Pages
2. Source: **GitHub Actions**
3. El workflow `pages.yml` despliega `docs/` automáticamente en cada push a main.

## URL del repo F-Droid

Una vez activado GitHub Pages, el repo F-Droid queda en:
```
https://luisitoys12.github.io/appstery/fdroid/repo
```
Agrega esa URL en F-Droid → Settings → Repositories → `+`

## Hacer el primer release

```bash
git tag v1.0.0
git push origin v1.0.0
```
Esto dispara el workflow completo: build → scan → release → fdroid update.
