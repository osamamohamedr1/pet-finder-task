# Pet Finder 🐱

A modern Flutter application for discovering and adopting cats. Browse different cat breeds, view detailed information, and save your favorites.

## Screenshots

| Home Screen | Breed Details |
|------------|---------------|
|<img width="500" height="1500" alt="Screenshot_1760618723" src="https://github.com/user-attachments/assets/d46becbe-bea4-4a8e-94bc-7d7fa36535b1" />| <img width="500" height="1500" alt="Screenshot_1760618737" src="https://github.com/user-attachments/assets/ca008bcb-affc-4e76-ad2f-976ded8d4b68" />|
## Features

- 🔍 Browse cat breeds from The Cat API
- 📱 Responsive UI with ScreenUtil
- 💾 Cached network images for better performance
- ❤️ Mark breeds as favorites

## Tech Stack


### State Management
- **flutter_bloc** ^8.1.6 - BLoC pattern implementation
- **dartz** ^0.10.1 - Functional error handling

### Networking
- **dio** ^5.9.0 - HTTP client
- **pretty_dio_logger** ^1.4.0 - Network logging

### UI & Styling
- **flutter_screenutil** ^5.9.3 - Responsive UI
- **flutter_svg** ^2.0.10+1 - SVG support
- **cached_network_image** ^3.4.1 - Image caching

### Architecture
- Clean Architecture
- Repository Pattern
- Either (Dartz) for error handling

## Project Structure

```
lib/
├── core/
│   ├── helpers/           # Utility functions & extensions
│   ├── networking/        # API service & constants
│   ├── routes/           # App routing
│   └── theme/            # Colors, text styles
├── features/
│   ├── bottom_bar/       # Bottom navigation
│   └── pets/
│       ├── data/
│       │   ├── models/   # Data models
│       │   └── repositories/
│       └── presentation/
│           ├── cubit/    # State management
│           └── views/    # UI screens & widgets
└── main.dart
```


## API

This app uses [The Cat API](https://thecatapi.com/) to fetch cat breed information.

**Endpoint:** `https://api.thecatapi.com/v1/breeds`

## Error Handling

The app implements comprehensive error handling:
- ✅ Network errors (timeout, no connection)
- ✅ HTTP errors (400, 404, 500)
- ✅ Invalid response format
- ✅ User-friendly error messages
- ✅ Retry functionality

## Testing

### Test Coverage

The project includes comprehensive unit tests for the data and presentation layers.



### Test Structure

```
test/
└── features/
    └── pets/
        ├── data/
        │   └── repositories/
        │       └── breeds_repository_test.dart    # Repository layer tests
        └── presentation/
            └── cubit/
                └── breeds_cubit_test.dart         # State management tests
```

### What's Tested

#### Repository Tests (`breeds_repository_test.dart`)
- ✅ Successful API calls and data parsing
- ✅ Empty response handling
- ✅ Network errors (timeout, connection errors)
- ✅ Invalid response format handling
- ✅ Unexpected exceptions
- ✅ Default parameter values

#### Cubit Tests (`breeds_cubit_test.dart`)
- ✅ Initial state verification
- ✅ Loading → Success state flow
- ✅ Loading → Error state flow
- ✅ Retry functionality
- ✅ Empty data handling
- ✅ Multiple consecutive calls

### Testing Tools

- **mockito** ^5.4.4 - Mock dependencies
- **bloc_test** ^9.1.7 - Cubit/Bloc testing utilities
- **build_runner** ^2.4.13 - Code generation for mocks

### Generating Mock Files

When you add new tests with `@GenerateMocks`, run:

```bash
# Generate mocks for testing
flutter pub run build_runner build --delete-conflicting-outputs

# Or watch for changes
flutter pub run build_runner watch --delete-conflicting-outputs
```

## Contact

**Osama Mohamed**
- GitHub: [@osamamohamedr1](https://github.com/osamamohamedr1)

---


