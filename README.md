# Movie App

A Flutter project for a movie app.

## Project Structure

The project is structured into the following directories:

- `lib`: Contains the Dart code for the app.
- `pubspec.yaml`: The configuration file for the project.

## Lib Directory

The `lib` directory contains the following subdirectories:

- `core`: Contains the core functionality of the app, including constants, error handling, and locator setup.
- `data`: Contains the data models and repository for the app.
- `future`: Contains the BLoC (Business Logic Component) architecture for the app, including cubits and states.
- `main.dart`: The entry point of the app.

## Pubspec.yaml

The `pubspec.yaml` file contains the project's dependencies and configuration.

## Dependencies

The project depends on the following packages:

- `flutter`
- `cupertino_icons`
- `flutter_bloc`
- `http`
- `go_router`
- `carousel_slider`
- `google_fonts`
- `fpdart`
- `get_it`

## Constants

The `Constrants` class in [lib/core/constrants.dart](cci:7://file:///c:/Z-Developments/My%20All%20Projects/movie_app/lib/core/constrants.dart:0:0-0:0) contains the following constants:

- `imageUrl`: The base URL for image assets.
- `apiKey`: The API key for the movie database.
- `baseUrl`: The base URL for the movie database API.
- `trandingEndPoint`: The endpoint for trending movies.
- `topRatedEndPoint`: The endpoint for top-rated movies.
- `upCommingEndPoint`: The endpoint for upcoming movies.
