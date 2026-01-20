# Flutter Album Viewer

A robust Flutter application that fetches, displays, and allows users to explore photo albums via the JSONPlaceholder API. The app showcases the use of clean architecture, BLoC state management, and modern Flutter best practices.

## Features

- **Browse Albums:** Fetches and lists album titles from a REST API
- **Album Details:** View photos belonging to a specific album in a separate detail view
- **Modern Flutter Architecture:** Uses Domain-Driven Design (DDD) and the MVVM pattern for scalable code
- **BLoC State Management:** Efficient asynchronous UI updates with BLoC
- **Networking:** Powered by the `http` package for API calls
- **Routing:** Page navigation with `go_router`
- **Extensible:** Easy to add new features or data sources


## Tech Stack

- **UI Layer:** Flutter Widgets (Material Design)
- **Networking:** http
- **State Management:** flutter_bloc
- **Architecture:** MVVM, Domain Driven Design (DDD)
- **Routing:** go_router

## 🚀 Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/AffableMelon/flutter_lab_assignment_3.git
   cd flutter_lab_assignment_3
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

Applications targets Android/iOS and runs on web with minimal adjustments as well.

## Project Structure

- `lib/data`: API services, models, and data sources
- `lib/domain`: Business logic, entities, repositories, usecases
- `lib/presentation`: BLoC, UI screens, and widgets

## API Used

This app uses the free [JSONPlaceholder](https://jsonplaceholder.typicode.com/) API for albums and photos.

## Author

Developed by **Kibreab Chanyalew**  
[GitHub: AffableMelon](https://github.com/AffableMelon)
