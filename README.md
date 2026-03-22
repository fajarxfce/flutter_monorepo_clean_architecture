# Monorepo Flavors & Build Guide

This document outlines the implementation, execution, and build strategy for environments (flavors) inside this monorepo architecture.

## Supported Flavors

The `app` module is configured with two native product flavors using `flutter_flavorizr`:

1. **Dev**
   - Flavor ID: `dev`
   - Application ID: `com.fajar.app.dev`
   - App Name: `Belajar Dev`
   - Base URL: `http://192.168.1.39:3000` (Sandbox API)
   - Indicator: Green "DEV" banner displayed locally.

2. **Prod**
   - Flavor ID: `prod`
   - Application ID: `com.fajar.app`
   - App Name: `Belajar`
   - Base URL: `https://api.domain-produksi.com` (Production API)
   - Indicator: None.

These configurations are injected deeply from `app/lib/flavors.dart`, propagated through the `AppModule` DI into the `NetworkModule` under the `core/network` package via `@Named('BaseUrl')`.

## Running the Application

Because flavors manipulate the native build configuration directly, standard `flutter run` will fail. You must define the targeted flavor explicitly.

Navigate into the `app` directory first:

```bash
cd app
```

### Dev Mode

To run the development flavor:

```bash
flutter run --flavor dev -t lib/main.dart
```

### Prod Mode

To run the production flavor (still in debug mode for development purposes):

```bash
flutter run --flavor prod -t lib/main.dart
```

_Note: For VS Code users, standard Launch Configuration has been updated. Open the "Run and Debug" panel (F5) and select either `App (Dev)` or `App (Prod)`._

## Building Release Artifacts (AOT)

To generate binaries for release deployment, you must explicitly pass the flavor alongside the release flag to ensure strict AOT compilation and correct application identifiers.

Navigate into the `app` directory first:

```bash
cd app
```

### Android APK Build

```bash
# Build Dev APK
flutter build apk --flavor dev -t lib/main.dart

# Build Prod APK (for store submission)
flutter build apk --release --flavor prod -t lib/main.dart
```

### Android App Bundle (AAB) Build

To build an Android App Bundle intended for Google Play Console submission:

```bash
flutter build appbundle --release --flavor prod -t lib/main.dart
```

### iOS Build

_Assuming Xcode configuration is complete._

```bash
flutter build ipa --release --flavor prod -t lib/main.dart
```

## Setup & Delivery via Shorebird (OTA Updates)

This project integrates [Shorebird](https://shorebird.dev) to provide Over-The-Air (OTA) updates directly to user devices without requiring store reviews. It seamlessly supports the flavor-based architecture.

Ensure you are always inside the `app` directory when executing Shorebird commands. 

### Creating a Release
To create an initial base release that includes the Shorebird embedder:

```bash
# Create Prod release (Android Bundle)
shorebird release android --flavor prod -t lib/main.dart
```
*Note: This command will ask if you want to upload the generated artifact. You must deploy this artifact to Google Play (or your target distribution platform).*

### Creating a Patch (OTA Update)
When making logic or UI modifications that do not involve native dependency changes, you can push a patch directly to live users:

```bash
shorebird patch android --flavor prod -t lib/main.dart
```
*Users will receive the latest dart code over-the-air upon their next app restart.*

## Adding or Modifying Configurations

1. **Changing Text/App IDs**: Edit `app/flavorizr.yaml` and regenerate using `dart run flutter_flavorizr`.
2. **Environment Variables**: Edit `app/lib/flavors.dart` inside the `F` class to introduce new getters (e.g. `apiKey`), then inject them via `AppModule` using a `@Named('YourKey')` tag.
3. **App Icons**: Native icons are dynamically stored under `app/android/app/src/<flavor_name>/res/`. Replace image assets accordingly per environment.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
