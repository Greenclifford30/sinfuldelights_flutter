# Sinful Delights - Flutter Application

A multi-platform Flutter application for Sinful Delights private chef business, enabling staff to manage daily menus and customers to order meals, subscribe to meal-prep plans, or request catering services.

## Features

### Customer Features
- **Daily Menu Browsing**: View today's menu with high-quality images and detailed descriptions
- **Cart Management**: Add items to cart with quantity controls and real-time total calculations
- **Meal-Prep Subscriptions**: Multi-step subscription flow with plan selection and preferences
- **Catering Requests**: Comprehensive form for event planning and custom quotes

### Admin Features (Placeholder)
- **Analytics Dashboard**: Real-time metrics for sales, orders, and subscriptions
- **Menu Management**: Quick actions for inventory and order management
- **Activity Monitoring**: Recent activity feed with key business events

### Technical Features
- **Clean Architecture**: Presentation, Domain, and Data layers with clear separation
- **State Management**: Riverpod for reactive state management
- **Navigation**: GoRouter with nested navigation and URL support
- **Responsive Design**: Adaptive layouts for mobile, tablet, and desktop
- **Theming**: Dark theme with Sinful Delights brand colors (#8B0000 crimson, #FF7A00 orange)

## Getting Started

### Prerequisites

- Flutter SDK 3.22.0 or later
- Dart 3.8.1 or later
- Android Studio / VS Code with Flutter extensions
- For iOS development: Xcode and CocoaPods

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd sinfuldelights_flutter
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run code generation** (for Freezed, JSON serialization, and Riverpod)
   ```bash
   flutter packages pub run build_runner build
   ```

4. **Set up environment configuration**
   - Copy `.env` file and update with your API keys
   - For production builds, create `.env.production` with production values

### Running the Application

#### Development Mode
```bash
flutter run
```

#### Platform-specific builds

**Web**
```bash
flutter run -d chrome
flutter build web
```

**Android**
```bash
flutter run -d android
flutter build apk --release
```

**iOS**
```bash
flutter run -d ios
flutter build ios --release
```

### Testing

#### Run all tests
```bash
flutter test
```

#### Run tests with coverage
```bash
flutter test --coverage
```

#### Run specific test files
```bash
flutter test test/unit/menu_test.dart
flutter test test/widget/menu_item_card_test.dart
```

#### Golden tests
```bash
flutter test --update-goldens  # Update golden files
flutter test test/widget/      # Run widget tests with golden comparisons
```

### Code Quality

#### Analyze code
```bash
flutter analyze
```

#### Format code
```bash
dart format .
```

#### Check for outdated packages
```bash
flutter pub outdated
```

## Project Structure

```
lib/
├── core/                      # Cross-cutting concerns
│   ├── theme/                 # App theming and brand colors
│   ├── env/                   # Environment configuration
│   └── exceptions/            # Error handling and failures
├── features/                  # Feature modules
│   ├── menu/                  # Daily menu functionality
│   │   ├── data/              # API clients and repositories
│   │   ├── domain/            # Models and business logic
│   │   └── presentation/      # Screens, widgets, and controllers
│   ├── cart/                  # Shopping cart management
│   ├── subscription/          # Meal-prep subscriptions
│   ├── catering/             # Catering request forms
│   ├── admin/                # Admin dashboard (placeholder)
│   └── auth/                 # Authentication (future)
├── router/                   # Navigation configuration
└── main.dart                 # Application entry point

test/
├── unit/                     # Unit tests for models and logic
├── widget/                   # Widget tests with golden files
└── integration/              # End-to-end tests (future)
```

## Architecture

The application follows **Clean Architecture** principles with clear separation between layers:

- **Presentation Layer**: UI components, screens, and Riverpod controllers
- **Domain Layer**: Business logic, models, and use cases
- **Data Layer**: API clients, repositories, and data sources

### Key Technologies

- **State Management**: Riverpod 2 with code generation
- **Navigation**: GoRouter for declarative routing
- **Networking**: Dio with interceptors for API calls
- **Serialization**: Freezed + JSON annotation for immutable models
- **Testing**: flutter_test, mocktail, golden_toolkit

## Configuration

### Environment Variables

Create a `.env` file in the root directory:

```env
API_BASE_URL=https://api-dev.sinfuldelights.com/v1
PUBLIC_API_KEY=your-api-key-here
STRIPE_PUBLISHABLE_KEY=pk_test_your-stripe-key
```

### Build Configurations

For different environments, use:

```bash
# Development
flutter run --dart-define-from-file=.env

# Production
flutter build web --dart-define-from-file=.env.production
```

## Future Integrations

The following integrations are stubbed with TODOs:

- **Firebase Authentication**: Social sign-in (Google, Apple, Facebook)
- **Stripe Payments**: One-time payments and subscriptions
- **Firebase Cloud Messaging**: Push notifications
- **Firebase Analytics**: Event tracking and analytics
- **AWS API Gateway**: Production API endpoints

## Contributing

1. Follow the existing code style and architecture patterns
2. Write tests for new features and bug fixes
3. Run `flutter analyze` and fix any issues before committing
4. Use conventional commit messages
5. Update documentation for significant changes

## License

This project is proprietary software for Sinful Delights business.

## Support

For development questions or issues:
1. Check existing documentation and code comments
2. Run `flutter doctor` to verify your environment
3. Use `flutter logs` to debug runtime issues
4. Consult the Flutter documentation for framework-specific questions