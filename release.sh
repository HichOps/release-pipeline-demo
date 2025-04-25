#!/bin/bash

# 🚀 Script unifié de release
set -e  # Stoppe le script en cas d'erreur

# Couleurs pour affichage
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # Reset color

# Vérifie si un argument est passé
TOOL="$1"

# Fonction d'affichage d'un petit menu interactif
function show_menu() {
  echo "Quel outil veux-tu utiliser pour la release ?"
  echo "1) standard-version"
  echo "2) release-it"
  echo "3) semantic-release"
  read -p "Choix [1-3]: " choice
  case $choice in
    1) TOOL="standard-version" ;;
    2) TOOL="release-it" ;;
    3) TOOL="semantic-release" ;;
    *) echo -e "${RED}Choix invalide${NC}"; exit 1 ;;
  esac
}

# Affiche le menu si aucun argument
if [ -z "$TOOL" ]; then
  show_menu
fi

echo -e "${GREEN}--- Lancement de la release avec : $TOOL ---${NC}"

# Execution selon l'outil
case $TOOL in
  standard-version)
    echo "📦 Lancement de standard-version"
    npx standard-version
    git push --follow-tags origin main
    ;;
  release-it)
    echo "🚀 Lancement de release-it"
    npx release-it
    ;;
  semantic-release)
    echo "🤖 Lancement de semantic-release"
    npx semantic-release
    ;;
  *)
    echo -e "${RED}Erreur : outil non reconnu${NC}"
    exit 1
    ;;
esac

echo -e "${GREEN}✅ Release complétée avec succès via $TOOL${NC}"
