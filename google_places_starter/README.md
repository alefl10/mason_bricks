# Google Places Starter

A mason brick to populate a very good Flutter App ready to interact with the Google Places API.

🦄 This brick uses [very_good_cli](https://pub.dev/packages/very_good_cli) for the creation of the App. Therefore, this package features the same directory structure, and additional configurations found in a Flutter app and Dart package created with the following commands, respectively:
```
very_good create
```

```
very_good create -t dart_pkg
```

🚨 This brick uses `Super Initializers`. Make sure you're using dart 2.17 on your end.


## ℹ️ Info
This brick intends to facilitate and speed up the creation of a scalable Flutter App with built-in best practices ready to interact with the [Google Places API](https://developers.google.com/maps/documentation/places/web-service) out of the box.

- 🔑 Allows developers to set different Google Maps API keys for their corresponding execution environments: development, staging, production.
    - [More info on API Keys](https://developers.google.com/maps/documentation/places/web-service/get-api-key)

- 📍 Includes the necessary configurations for Android and iOS to provide in-app location permission.

- 🧪 Comes with 100% code coverage through unit, bloc, and widget testing.

- ✨ And all from a single CLI command!

## 💻 How to use

```
mason make google_places_starter
```

## ✅ Outputs
Under the newly generated directory named after the provided `app_name`, you will find:

### .github
It contains all the GitHub `workflows` for the main app as well as the included **packages**, among other files.
```
├── .github
|   ├── workflows
|   |   ├── google_places_client.yaml
|   |   ├── google_places_repo.yaml
|   |   ├── main.yaml
|   |   └── permission_client.yaml
|   ├── dependabot.yaml
|   └── PULL_REQUEST_TEMPLATE.md
└── ...
```

### config
This directory contains the `app_config.json` file which includes the Google Maps API keys for your App's different environments.

Notice this directory and all of its nested contents will not be checkout or committed to git since it's included in the `.gitignore` file as it contains sensitive information.
```
├── config
|   ├── app_config.json
└── ...
```

### lib
As in every Flutter App, this is the core directory where the app features will live.

This brick comes prepackaged with some features and an opinionated directory structure to help you get up and running with your App right away.

Most notably,

- `main` includes all the entry-point files to your app as well as the corresponding configuration files to handle app flavors.
- `permission` includes a bloc that handles the location permission request for the underlying device-specific platform. This bloc will be accessible throughout the App as it is provided at the root of the Widget Tree.

```
├── lib
|   ├── app
|   |   ├── view
|   |   |   ├── app.dart
|   |   └── app.dart
|   ├── home
|   |   ├── view
|   |   |   ├── home_page.dart
|   |   └── home.dart
|   ├── l10n
|   |   ├── arb
|   |   |   ├── app_en.arb
|   |   |   └── app_es.arb
|   |   └── l10n.dart
|   ├── main
|   |   ├── configs
|   |   |   ├── app_environment.dart
|   |   |   ├── config_reader.dart
|   |   |   └── configs.dart
|   |   ├── bootstrap.dart
|   |   ├── main_common.dart
|   |   ├── main_development.dart
|   |   ├── main_production.dart
|   |   └── main_staging.dart
|   ├── permission
|   |   ├── bloc
|   |   |   ├── permission_bloc.dart
|   |   |   ├── permission_event.dart
|   |   |   └── permission_state.dart
|   |   └── permission.dart
└── ...
```

### packages
This directory contains all the out-of-the-box packages that the newly created app relies on to function properly.

- `google_places_client` - Implements an http client to interact with the Google Places API. It currently supports:
    - [Place Details](https://developers.google.com/maps/documentation/places/web-service/details) - /details
    - [Find Place](https://developers.google.com/maps/documentation/places/web-service/search-find-place) - /findplacefromtext
    - [Nearby Search](https://developers.google.com/maps/documentation/places/web-service/search-nearby) - /nearbysearch

- `google_places_models` - Includes Dart models to handle JSON objects from the Google Places API.
    - This package is populated from the `google_places_models` template - check out the [brick](https://brickhub.dev/bricks/google_places_models/).

- `google_places_repo` - Exposes a repository implementation to interact with the Google Places API via the GooglePlacesClient.
- `permission_client` - Handles on-device permission requests.

```
├── packages
|   ├── google_places_client
|   ├── google_places_models
|   ├── google_places_repo
|   └── permission_client
└── ...
```

## 🤝 Contribute
Would you like to enhance the functionality of this brick? Awesome!

Feel free to submit any [PRs](https://github.com/alefl10/mason_bricks/tree/main/google_places_starter/pulls) with your suggestions.

