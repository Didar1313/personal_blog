## Features

- Fetch list of blog posts from Spring Boot API (`/api/posts`)
- View full details of a blog post (`/api/posts/{id}`)
- Simple and clean UI using Flutter
- Mobile-ready integration with local backend

---

## Tech Stack

| Layer        | Technology       |
|--------------|------------------|
| Frontend     | Flutter           |
| Backend      | Spring Boot (REST API) |
| Data Format  | JSON              |
| Network      | `http` package in Flutter |

---

## Project Structure (Flutter)

```

lib/
├── main.dart                 # App entry point
├── home\_page.dart           # Shows list of posts
├── post\_detail\_page.dart    # Shows post detail
├── models/
│   └── post.dart            # Post model
├── services/
│   └── api\_service.dart     # Handles API calls

````

---

## How It Works

### REST API Endpoints (Spring Boot)

| Endpoint             | Description               |
|----------------------|---------------------------|
| `GET /api/posts`     | Returns list of posts     |
| `GET /api/posts/{id}`| Returns single post detail|

>  Make sure Spring Boot uses `@RestController` to return JSON, not just HTML views.

### Network Setup

Since Flutter and Spring Boot run on different layers:

- Use your **local IP address** in the Flutter API base URL (not `localhost`)
- For example:
  ```dart
  static const String baseUrl = 'http://192.168.0.198:8080/api';
````
---

## Dependencies

Add this to `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^0.13.6
```

Run:

flutter pub get

---

## API Integration (Sample)

### Fetch all posts

```dart
final response = await http.get(Uri.parse('$baseUrl/posts'));
```

### Fetch single post

```dart
final response = await http.get(Uri.parse('$baseUrl/posts/{id}'));
```



