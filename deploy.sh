#!/bin/bash

# Script de déploiement Jenkins Demo Site
echo "=== Début du déploiement ==="

# Variables
DEPLOY_DIR="/srv/http/jenkins-demo"
BUILD_INFO_FILE="$DEPLOY_DIR/build-info.txt"

# Créer le dossier de déploiement s'il n'existe pas
mkdir -p $DEPLOY_DIR

echo "Déploiement des fichiers vers $DEPLOY_DIR"

# Copier tous les fichiers HTML/CSS vers le serveur web
cp *.html $DEPLOY_DIR/ 2>/dev/null || echo "Aucun fichier HTML trouvé"
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
    echo "✅ Déploiement réussi ! Site accessible sur http://$(hostname -I | awk '{print $1}')/jenkins-demo"
else
    echo "❌ Erreur : index.html non trouvé après déploiement"
    exit 1
fi

echo "=== Déploiement terminé ==="