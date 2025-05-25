#!/bin/bash

# Script de déploiement Jenkins Demo Site
echo "=== Début du déploiement ==="
echo "Variables Jenkins disponibles:"
echo "BUILD_NUMBER: ${BUILD_NUMBER}"
echo "BUILD_ID: ${BUILD_ID}"
echo "BUILD_URL: ${BUILD_URL}"
echo "JOB_NAME: ${JOB_NAME}"
echo "GIT_COMMIT: ${GIT_COMMIT}"
echo "GIT_BRANCH: ${GIT_BRANCH}"

# Variables
DEPLOY_DIR="/srv/http/jenkins-demo"
BUILD_INFO_FILE="$DEPLOY_DIR/build-info.txt"

# Créer le dossier de déploiement s'il n'existe pas
mkdir -p $DEPLOY_DIR

echo "Déploiement des fichiers vers $DEPLOY_DIR"

# Copier et modifier le fichier HTML avec les vraies infos Jenkins
if [ -f "index.html" ]; then
    # Remplacer les placeholders par les vraies valeurs Jenkins
    sed "s/{{BUILD_NUMBER}}/${BUILD_NUMBER:-1}/g" index.html | \
    sed "s/{{BUILD_ID}}/${BUILD_ID:-unknown}/g" | \
    sed "s/{{BUILD_TIMESTAMP}}/$(date)/g" | \
    sed "s/{{GIT_COMMIT}}/${GIT_COMMIT:-unknown}/g" > $DEPLOY_DIR/index.html
    
    echo "✅ HTML modifié avec les infos de build Jenkins"
else
    echo "❌ index.html non trouvé"
fi

# Copier les autres fichiers
cp *.css $DEPLOY_DIR/ 2>/dev/null || echo "Aucun fichier CSS trouvé"
cp *.js $DEPLOY_DIR/ 2>/dev/null || echo "Aucun fichier JS trouvé"

# Créer un fichier avec les informations de build
cat > $BUILD_INFO_FILE << EOF
Build Number: ${BUILD_NUMBER:-"Manual"}
Build Date: $(date)
Git Commit: ${GIT_COMMIT:-"Unknown"}
Jenkins Job: ${JOB_NAME:-"Manual deployment"}
EOF

echo "Contenu déployé :"
ls -la $DEPLOY_DIR

# Vérifier que le fichier principal existe
if [ -f "$DEPLOY_DIR/index.html" ]; then
    echo "✅ Déploiement réussi ! Site accessible sur http://localhost/jenkins-demo"
else
    echo "❌ Erreur : index.html non trouvé après déploiement"
    exit 1
fi

echo "=== Déploiement terminé ==="