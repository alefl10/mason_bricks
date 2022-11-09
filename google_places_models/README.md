# Google Places Models

A mason brick to populate a Dart package including models to handle JSON objects from the Google Places API.

🦄 This brick uses [very_good_cli](https://pub.dev/packages/very_good_cli) for the creation of the `google_places_models` package. Therefore, this package features the same directory structure, `.github` contents, and additional configurations found in a dart package created with the following command:
```
very_good create -t dart_pkg
```

Note: This brick uses `Super Initializers` for the dart models. Therefore, make sure you're using dart 2.17 on your end.


## 💻 How to use

```
mason make google_places_models
```

## ℹ️ Info
The intention of this brick is to facilitate and speed up the handling of the JSON objects returned from various Google Places API endpoints (https://maps.googleapis.com/maps/api/place/).

It currently supports:
- [Place Details](https://developers.google.com/maps/documentation/places/web-service/details) - /details
- [Find Place](https://developers.google.com/maps/documentation/places/web-service/search-find-place) - /findplacefromtext
- [Nearby Search](https://developers.google.com/maps/documentation/places/web-service/search-nearby) - /nearbysearch

[Pull Requests](https://github.com/alefl10/mason_bricks/google_places_models_brick/pulls) to enhance and extend the package support are always welcome 😉

## 📦 Dependencies

| Dependency           | Description                                                     |
| ------------------ | --------------------------------------------------------------- |
| `equatable`         | A Dart package that helps to implement value based equality without needing to explicitly override == and hashCode. See [docs](https://pub.dev/packages/equatable).                   |
| `feature_name`     | Classes and helper functions that support JSON code generation via the `json_serializable` package. See [docs](https://pub.dev/packages/json_annotation).  |
| `build_runner`     | A build system for Dart code generation and modular compilation. See [docs](https://pub.dev/packages/build_runner).  |
| `json_serializable`     | Automatically generate code for converting to and from JSON by annotating Dart classes. See [docs](https://pub.dev/packages/json_serializable).  |
| `very_good_analysis`     | Lint rules for Dart and Flutter used internally at [Very Good Ventures](https://verygood.ventures/). See [docs](https://pub.dev/packages/very_good_analysis).  |

## ✅ Outputs

See [GitHub repository](https://github.com/alefl10/mason_bricks/google_places_models_brick/tree/main/__brick__/packages/google_places_models) to check the directory structure.