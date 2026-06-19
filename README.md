# Gestionnaire de tâches — Projet final Flutter Desktop

Application de gestion de tâches avancée (architecture hexagonale, Riverpod, auto_route, persistance locale).

## Prérequis

- Flutter SDK stable (desktop Windows et/ou Linux activés)
- `flutter doctor` sans erreur bloquante pour la plateforme cible

## Installation

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

## Lancer l'application

```bash
flutter run -d windows
# ou (Linux — installer d'abord les dépendances système)
# sudo apt install clang cmake ninja-build pkg-config libgtk-3-dev libnotify-dev
flutter run -d linux
```

## Tests et qualité

```bash
flutter analyze
flutter test
flutter test --coverage
```

## Architecture (`lib/`)

| Couche | Rôle |
|--------|------|
| `core/` | Constantes, erreurs, utilitaires |
| `domain/` | Entités Freezed, interfaces repositories |
| `application/` | Use cases, providers Riverpod |
| `infrastructure/` | SharedPreferences, implémentations repos |
| `presentation/` | UI, router auto_route, thème Material 3 |

## Fonctionnalités

- CRUD tâches avec validation et confirmation de suppression (`AlertDialog`)
- Sidebar : Projets, Aujourd'hui, Cette semaine, Paramètres
- Persistance tâches, projets et thème (`shared_preferences` + JSON)
- Thème clair/sombre Material 3 (`colorSchemeSeed`)
- Raccourcis : **Ctrl+N** (nouvelle tâche), **Ctrl+F** (recherche), **Ctrl+D** (thème)
- Fenêtre min. 800×600, titre personnalisé (`window_manager`)
- Tests unitaires mockito + overrides Riverpod
- Filtres statut, priorité, projet et recherche texte
- Drag & drop (réordonnancement des tâches)
- Sous-tâches et tags colorés
- Statistiques dans Paramètres
- Export JSON / CSV (`file_picker`)
- Notifications échéances du jour (`local_notifier`)
- CI multi-plateforme + release sur tag `v*`

## CI/CD

- `.github/workflows/ci.yml` — analyze, test, build Windows + Linux
- `.github/workflows/release.yml` — artefacts sur tag `v*`
