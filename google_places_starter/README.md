# Google Places Starter

A mason brick to populate a very good Flutter App ready to interact with the Google Places API.

๐ฆ This brick uses [very_good_cli](https://pub.dev/packages/very_good_cli) for the creation of the App. Therefore, this package features the same directory structure, and additional configurations found in a Flutter app and Dart package created with the following commands, respectively:
```
very_good create
```

```
very_good create -t dart_pkg
```

๐จ This brick uses `Super Initializers`. Make sure you're using dart 2.17 on your end.


## โน๏ธ Info
This brick intends to facilitate and speed up the creation of a scalable Flutter App with built-in best practices ready to interact with the [Google Places API](https://developers.google.com/maps/documentation/places/web-service) out of the box.

- ๐ Allows developers to set different Google Maps API keys for their corresponding execution environments: development, staging, production.
    - [More info on API Keys](https://developers.google.com/maps/documentation/places/web-service/get-api-key)

- ๐ Includes the necessary configurations for Android and iOS to provide in-app location permission.

- ๐งช Comes with 100% code coverage through unit, bloc, and widget testing.

- โจ And all from a single CLI command!

## ๐ป How to use

```
mason make google_places_starter
```

## โ Outputs
Under the newly generated directory named after the provided `app_name`, you will find:

### .github
It contains all the GitHub `workflows` for the main app as well as the included **packages**, among other files.
```
โโโ .github
|   โโโ workflows
|   |   โโโ google_places_client.yaml
|   |   โโโ google_places_repo.yaml
|   |   โโโ main.yaml
|   |   โโโ permission_client.yaml
|   โโโ dependabot.yaml
|   โโโ PULL_REQUEST_TEMPLATE.md
โโโ ...
```

### config
This directory contains the `app_config.json` file which includes the Google Maps API keys for your App's different environments.

Notice this directory and all of its nested contents will not be checkout or committed to git since it's included in the `.gitignore` file as it contains sensitive information.
```
โโโ config
|   โโโ app_config.json
โโโ ...
```

### lib
As in every Flutter App, this is the core directory where the app features will live.

This brick comes prepackaged with some features and an opinionated directory structure to help you get up and running with your App right away.

Most notably,

- `main` includes all the entry-point files to your app as well as the corresponding configuration files to handle app flavors.
- `permission` includes a bloc that handles the location permission request for the underlying device-specific platform. This bloc will be accessible throughout the App as it is provided at the root of the Widget Tree.

```
โโโ lib
|   โโโ app
|   |   โโโ view
|   |   |   โโโ app.dart
|   |   โโโ app.dart
|   โโโ home
|   |   โโโ view
|   |   |   โโโ home_page.dart
|   |   โโโ home.dart
|   โโโ l10n
|   |   โโโ arb
|   |   |   โโโ app_en.arb
|   |   |   โโโ app_es.arb
|   |   โโโ l10n.dart
|   โโโ main
|   |   โโโ configs
|   |   |   โโโ app_environment.dart
|   |   |   โโโ config_reader.dart
|   |   |   โโโ configs.dart
|   |   โโโ bootstrap.dart
|   |   โโโ main_common.dart
|   |   โโโ main_development.dart
|   |   โโโ main_production.dart
|   |   โโโ main_staging.dart
|   โโโ permission
|   |   โโโ bloc
|   |   |   โโโ permission_bloc.dart
|   |   |   โโโ permission_event.dart
|   |   |   โโโ permission_state.dart
|   |   โโโ permission.dart
โโโ ...
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
โโโ packages
|   โโโ google_places_client
|   โโโ google_places_models
|   โโโ google_places_repo
|   โโโ permission_client
โโโ ...
```

## ๐ค Contribute
Would you like to enhance the functionality of this brick? Awesome!

Feel free to submit any [PRs](https://github.com/alefl10/mason_bricks/tree/main/google_places_starter/pulls) with your suggestions.

