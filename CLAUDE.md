# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter application for **Sinful Delights**, a private chef business platform. The app enables:
- Staff to publish daily menus, manage inventory, and analyze sales
- Customers to order meals, subscribe to meal-prep plans, or request catering
- Multi-platform deployment (Web, Android, iOS) from a single codebase

## Common Development Commands

### Core Flutter Commands
```bash
# Get dependencies
flutter pub get

# Run app in development
flutter run

# Run tests
flutter test

# Run tests with coverage
flutter test --coverage

# Analyze code for issues
flutter analyze

# Format code
dart format .

# Build for different platforms
flutter build web
flutter build apk
flutter build ipa
```

### Testing Commands
```bash
# Run widget tests
flutter test test/widget_test.dart

# Run all tests with verbose output
flutter test --reporter=expanded
```

## Architecture Overview

This is currently a **basic Flutter starter project** that will evolve into a complex multi-platform application. Based on the design documents, the planned architecture includes:

### Planned Tech Stack
- **State Management**: Riverpod 2 / flutter_riverpod
- **Navigation**: go_router 
- **Networking**: dio with interceptors
- **JSON Serialization**: json_serializable + freezed
- **Payments**: flutter_stripe
- **Analytics**: firebase_analytics
- **Push Notifications**: firebase_messaging
- **Authentication**: Firebase Auth
- **Environment Config**: flutter_dotenv

### Target Folder Structure (from Design Doc)
```
lib/
├── core/          # Cross-cutting utils (env, analytics, exceptions)
├── features/
│   ├── auth/
│   ├── menu/
│   ├── cart/
│   ├── subscription/
│   ├── catering/
│   └── admin/
├── l10n/          # Localization files
└── main.dart
```

### Current State
- Basic Flutter counter app (main.dart:123)
- Standard project structure with minimal dependencies
- Only cupertino_icons and flutter_lints as dependencies
- Basic widget test in test/widget_test.dart:31

## Key Business Context

### Core Features (Planned)
1. **Daily Menu Management** - CRUD operations with inventory tracking
2. **Customer Ordering** - Pickup-only MVP with time slots
3. **Meal-Prep Subscriptions** - Recurring billing via Stripe
4. **Catering Requests** - Invoice-based deposit system
5. **Analytics Dashboard** - Real-time metrics and reporting

### Design System
- **Primary Color**: rgb(139, 0, 0) (deep crimson)
- **Theme**: Dark backgrounds with black accents
- **Typography**: Inter font following Material 3 spec
- **Components**: 24px border radius, soft shadows

### Security Requirements
- HTTPS only
- API calls with X-API-Key header
- Firebase Auth ID tokens via Authorization header
- Rate limiting via AWS API Gateway Usage Plans

## Development Workflow

### Code Quality
- Uses flutter_lints for static analysis (analysis_options.yaml:29)
- Lint rules activated via package:flutter_lints/flutter.yaml
- Follow Material Design guidelines
- Maintain accessibility (WCAG 2.1 AA compliance planned)

### Testing Strategy (Planned)
- Unit tests for repositories and controllers
- Widget tests with golden toolkit
- Integration tests via flutter_driver
- 90%+ line coverage requirement for critical packages

## Environment Setup

The project will use environment-specific configuration:
- `.env.development` for local development
- `.env.production` for production builds
- Flutter build with `--dart-define=ENV=production`

## API Integration

Backend will be AWS Lambda behind API Gateway with endpoints like:
- `GET /v1/menu/today` - Fetch today's menu
- `POST /v1/order` - Place pickup order  
- `GET /v1/admin/analytics` - Dashboard metrics

## Current Development Status

This repository contains the initial Flutter project setup. The actual feature implementation is pending based on the comprehensive design documents in the `requirements/` folder:
- `sinful_delights_prd.md` - Product requirements
- `sinful_delights_flutter_design_doc.md` - Technical design

Next development phases will involve implementing the planned architecture, adding dependencies, and building out the feature modules according to the design specifications.