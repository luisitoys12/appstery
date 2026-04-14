#!/usr/bin/env bash
# Appstery — Renombrado automático de package cm.aptoide.pt → com.appstery.app
# Ejecutar desde la raíz del repositorio
set -euo pipefail

OLD_PKG="cm.aptoide.pt"
NEW_PKG="com.appstery.app"
OLD_PATH="cm/aptoide/pt"
NEW_PATH="com/appstery/app"

echo "🔄 Renombrando package: $OLD_PKG → $NEW_PKG"

# 1. Reemplazar en todos los archivos de texto
find . -type f \( \
  -name "*.java" -o -name "*.kt" -o -name "*.xml" \
  -o -name "*.gradle" -o -name "*.properties" \
  -o -name "*.json" -o -name "*.yaml" -o -name "*.yml" \
\) \
  ! -path "*/build/*" \
  ! -path "*/.git/*" \
  ! -path "*/node_modules/*" \
  -print0 | xargs -0 sed -i "s|${OLD_PKG}|${NEW_PKG}|g"

echo "✅ Referencias de texto actualizadas"

# 2. Mover directorios de código fuente Java/Kotlin
for SRC_ROOT in app aptoide-account-manager aptoide-analytics-core \
    aptoide-analytics-default-implementation aptoide-authentication-core \
    aptoide-authentication-rx aptoide-database aptoide-views aptoidepreferences \
    crashreports dataprovider downloadmanager packageinstaller utils; do
  for DIR_TYPE in main test androidTest; do
    OLD_DIR="${SRC_ROOT}/src/${DIR_TYPE}/java/${OLD_PATH}"
    NEW_DIR="${SRC_ROOT}/src/${DIR_TYPE}/java/${NEW_PATH}"
    if [ -d "$OLD_DIR" ]; then
      mkdir -p "$(dirname $NEW_DIR)"
      mv "$OLD_DIR" "$NEW_DIR"
      echo "  📁 Movido: $OLD_DIR → $NEW_DIR"
    fi
  done
done

echo ""
echo "🎉 Listo. Package renombrado a $NEW_PKG"
echo "   Siguiente paso: ./gradlew assembleVanillaProdRelease"
