# Rapport de Release

Ce rapport détaille le processus de mise en place de la pipeline de release automatisée pour le projet. Il inclut une description des outils testés, leurs avantages et inconvénients, ainsi qu'un retour sur le script final utilisé pour automatiser la gestion des versions et des releases.

## Outils Testés

### 1. **standard-version**
`standard-version` est un outil de gestion des versions qui se base sur les conventions de commit (Conventional Commits). Il automatise l'incrémentation des versions, la génération d'un changelog et la création des tags Git pour chaque nouvelle version.

### 2. **release-it**
`release-it` est un outil de gestion de version flexible qui permet de créer des releases en utilisant des conventions de commit, de mettre à jour le changelog, et de gérer des tâches comme le bump de version, la création de tags et le push vers des repositories distants.

### 3. **semantic-release**
`semantic-release` est un outil complet pour l'automatisation du versionnage basé sur les conventions de commit. Il génère automatiquement des versions, des changelogs, et des releases. Il est conçu pour être utilisé dans des pipelines CI/CD pour une gestion entièrement automatisée.

## Forces et Faiblesses de Chaque Outil

### **standard-version**
- **Forces** :
  - Facilité d'utilisation avec une configuration simple.
  - Création automatique de changelogs en fonction des conventions de commit.
  - Intégration simple avec GitHub Actions.
- **Faiblesses** :
  - Moins de flexibilité par rapport à d'autres outils comme `release-it` ou `semantic-release`.
  - Ne supporte pas nativement certaines intégrations comme les déploiements ou les versions distantes.

### **release-it**
- **Forces** :
  - Très configurable et flexible, avec la possibilité de personnaliser les étapes du processus de release.
  - Supporte les versions multiples et la publication sur npm ou GitHub.
  - Documentation claire et communauté active.
- **Faiblesses** :
  - La configuration initiale peut être plus complexe pour des projets simples.
  - Nécessite une gestion explicite des étapes de versionnement.

### **semantic-release**
- **Forces** :
  - Entièrement automatisé, réduisant le risque d'erreur humaine.
  - Gère les versions de manière intelligente selon les types de commits (major/minor/patch).
  - Intégration complète avec des services comme GitHub et npm.
- **Faiblesses** :
  - Nécessite une bonne configuration et une adoption stricte des conventions de commit.
  - Peut être excessif pour des projets simples où un simple script `standard-version` suffirait.

## Capture d'écran / Lien vers les Releases Publiées

Voici un lien vers les releases créées sur GitHub : [GitHub Releases](https://github.com/HichOps/release-pipeline-demo/releases)

Capture d'écran des releases : ![Release Screenshot](URL_de_la_capture_d'écran)

## Retour sur le Script Final

Le script `release.sh` automatise le processus de gestion de version et de release pour le projet. Il utilise l'outil `standard-version` pour :
- Mettre à jour la version dans `package.json` et `package-lock.json`.
- Générer automatiquement un changelog à partir des messages de commit.
- Taguer la release dans Git.
- Committer et pousser les changements sur la branche `main` et créer une release GitHub.

Ce processus permet de garantir une gestion cohérente des versions, tout en réduisant les risques d'erreur humaine.

## Conclusion

Le processus d'automatisation de la gestion des versions et des releases a permis de simplifier et d'accélérer la livraison de nouvelles versions du projet. Après avoir testé plusieurs outils, `standard-version` a été choisi pour sa simplicité d'utilisation et sa capacité à générer des changelogs automatiquement. L'intégration dans le pipeline CI/CD via GitHub Actions assure un processus de release fiable et reproductible.
