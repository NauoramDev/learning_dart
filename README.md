# 📱 Learning Code — Flutter Score Counter App

> A simple, clean, and practical Flutter app to **count**, **save**, and **review** scores with a smooth user experience.

---

## ✨ Overview

**Learning Code** is a cross-platform Flutter app (Android, iOS, Web, Desktop).
It includes an interactive counter, a timestamped score history, and a settings page for app customization.

Goal: provide a strong experimental base to learn Flutter with real app concepts (navigation, theming, local persistence, and clean structure).

---

## 🚀 Main Features

- ✅ **Interactive Counter**
	- Quick increments: `+1`, `+5`
	- Quick decrements: `-1`, `-5`
	- Auto-reset to `0` after saving a score

- ✅ **Score History**
	- Save each score with a timestamp (`date + time`)
	- Display from most recent to oldest
	- Empty-state message when no score exists

- ✅ **Local Data Persistence**
	- Save scores as JSON (`scores.json`)
	- Automatically reload data at app startup

- ✅ **Light / Dark Theme**
	- One-tap theme switch from settings
	- Theme applied across the whole app

- ✅ **Simple and Modern Navigation**
	- `BottomNavigationBar` with 3 tabs:
		- **Counter**
		- **History**
		- **Settings**

---

## 🧱 Tech Stack

- **Framework**: Flutter
- **Language**: Dart
- **State management**: `StatefulWidget` + parent/child callbacks
- **Local storage**: `dart:io` + `path_provider`
- **Serialization**: `dart:convert` (JSON)

---

## 🗂️ Project Structure (main app)

```text
lib/
├── main.dart              # Entry point + theme + navigation + score orchestration
├── home_page.dart         # Counter logic and save actions
├── history_page.dart      # Saved score list UI
├── setting_page.dart      # Settings (theme toggle + clear history)
└── storage_services.dart  # HystoryObject model + JSON save/load service
```

> The `lib/app1/` folder contains an additional experimental/learning version of the app.

---

## 📸 Assets

- Local image included: `assets/images/captain.png`

---

## ▶️ Run the Project

```bash
flutter pub get
flutter run
```

---

## 🎯 What This Project Demonstrates

This project showcases:

1. widget communication through callbacks,
2. simple shared app state handling,
3. local persistence without external databases,
4. dynamic theming,
5. a readable Flutter architecture for fast progression.

---

## 💡 Possible Next Improvements

- history filtering/search,
- statistics (average, max, min),
- CSV/JSON export,
- richer animations and premium UI,
- unit tests and widget tests.

---

## 👨‍💻 Author

Flutter learning project by **Marouan (NauoramDev)**.
