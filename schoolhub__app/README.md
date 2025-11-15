# SchoolHub - Espace Parent

Application Flutter pour l'espace Parent du système scolaire SchoolHub en Guinée Conakry.

## 📋 Description

Cette application permet aux parents de suivre la scolarité de leurs enfants :
- Consultation des notes et bulletins
- Suivi des absences
- Notifications importantes
- Profil et informations personnelles

## 🛠️ Technologies

- **Flutter 3.x** avec Dart null-safety
- **Material Design 3**
- **Riverpod** pour la gestion d'état
- **GoRouter** pour la navigation
- **Clean Architecture** / MVVM

## 🎨 Thème

- **Couleur principale** : `#2E7D32` (Vert foncé)
- **Couleur d'accent** : `#C8E6C9` (Vert clair)
- **Police** : Poppins (fallback Roboto)

## 📁 Structure du projet

```
lib/
  core/
    theme.dart          # Configuration du thème Material Design 3
    constants.dart      # Constantes (couleurs, routes)
  data/
    models/             # Modèles de données
    repositories/       # Repositories (mock API)
  domain/
    usecases/           # Cas d'utilisation
  presentation/
    main.dart           # Point d'entrée de l'application
    app_router.dart     # Configuration GoRouter
    pages/              # Pages de l'application
    widgets/            # Widgets réutilisables
  providers/            # Providers Riverpod
```

## 🚀 Installation

### Prérequis

- Flutter SDK 3.x ou supérieur
- Dart SDK 3.x ou supérieur
- Android Studio / Xcode (pour iOS)
- Un émulateur ou un appareil physique

### Étapes d'installation

1. **Cloner le dépôt** (si applicable)
   ```bash
   git clone <repository-url>
   cd schoolhub__app
   ```

2. **Installer les dépendances**
   ```bash
   flutter pub get
   ```

3. **Vérifier l'installation**
   ```bash
   flutter doctor
   ```

## ▶️ Lancement de l'application

### Android

1. **Démarrer un émulateur Android** ou connecter un appareil physique avec le mode développeur activé

2. **Lancer l'application**
   ```bash
   flutter run
   ```
   
   Ou spécifiquement pour Android :
   ```bash
   flutter run -d android
   ```

3. **Build de production** (APK)
   ```bash
   flutter build apk --release
   ```

### iOS

1. **Ouvrir le projet dans Xcode**
   ```bash
   open ios/Runner.xcworkspace
   ```

2. **Configurer les certificats de signature** dans Xcode

3. **Lancer l'application**
   ```bash
   flutter run -d ios
   ```

4. **Build de production** (IPA)
   ```bash
   flutter build ios --release
   ```

## 🔐 Compte de démonstration

Pour tester l'application, utilisez les identifiants suivants :

- **Email** : `demo@parent.com`
- **Mot de passe** : `1234`

## 🧪 Tests

Exécuter les tests unitaires :

```bash
flutter test
```

Les tests couvrent :
- Providers (auth_provider_test.dart)
- Repositories (mock_parent_repository_test.dart)

## 📱 Fonctionnalités

### Pages disponibles

1. **LoginPage** - Connexion avec authentification
2. **HomePage** - Page d'accueil avec vue d'ensemble
3. **ChildDetailPage** - Détails d'un enfant (notes, absences)
4. **BulletinPage** - Consultation des bulletins scolaires
5. **NotificationsPage** - Liste des notifications
6. **ProfilPage** - Profil utilisateur et déconnexion

### Navigation

- Navigation déclarative avec GoRouter
- Animations de transition (FadeTransition, SlideTransition)
- Hero animations pour les avatars

## 🏗️ Architecture

L'application suit une architecture Clean Architecture avec :

- **Domain** : Entités et cas d'utilisation (business logic)
- **Data** : Modèles, repositories et sources de données
- **Presentation** : UI, pages, widgets et providers

### Gestion d'état

Utilisation de **Riverpod** pour :
- `authStateProvider` - État d'authentification
- `childrenProvider` - Liste des enfants
- `notificationsProvider` - Notifications

### Mock API

Les services mock simulent des appels REST avec :
- Délais réseau simulés
- Données JSON statiques
- Générateurs de données pour les tests

## 📦 Dépendances principales

- `flutter_riverpod` - Gestion d'état
- `go_router` - Navigation déclarative
- `google_fonts` - Polices Poppins et Roboto
- `intl` - Formatage des dates

## 🔄 Prochaines étapes

- [ ] Intégration avec le backend Java Spring Boot
- [ ] Authentification réelle avec tokens
- [ ] Synchronisation des données
- [ ] Notifications push
- [ ] Mode hors ligne

## 📄 Licence

Ce projet fait partie du système SchoolHub pour les écoles en Guinée Conakry.

## 👥 Support

Pour toute question ou problème, contactez l'équipe de développement.
