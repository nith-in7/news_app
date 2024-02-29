# Flutter News App

This Flutter project utilizes the News API to provide users with the latest news articles. Users can browse news articles from various categories and view them directly within the app using a built-in web view.

## Features

- View news articles from different categories.
- Open news articles within the app using a web view.
- Utilizes Riverpod for state management.
- Carousel slider for enhanced article browsing experience.
- Fetches data from News API using HTTP requests.
- Displays news article images using cached network images.
- Custom splash screen and launcher icons.

## Packages Used

- [Riverpod](https://pub.dev/packages/riverpod): A simple way to manage the state of your Flutter application.
- [HTTP](https://pub.dev/packages/http): A composable, multi-platform, Future-based HTTP client for Flutter.
- [Webview Flutter](https://pub.dev/packages/webview_flutter): A Flutter plugin that provides a WebView widget.
- [Flutter Native Splash](https://pub.dev/packages/flutter_native_splash): Generates native code for adding custom splash screen to your Flutter app.
- [Cached Network Image](https://pub.dev/packages/cached_network_image): Flutter library to load and cache network images with placeholders and error widgets.
- [Flutter Launcher Icons](https://pub.dev/packages/flutter_launcher_icons): A command-line tool that updates Flutter app's launcher icons.
- [Carousel Slider](https://pub.dev/packages/carousel_slider): A carousel slider widget for Flutter, allowing infinite scroll with custom child widgets.

## Installation

1. Clone this repository: `git clone https://github.com/nith-in7/news_app.git`
2. Navigate to the project directory: `cd your_project`
3. Run `flutter pub get` to install dependencies.
4. Make sure to replace the placeholder API key in the code with your actual News API key.
5. Run the app using `flutter run`.

## Usage

- Upon launching the app, users are presented with categories of news.
- Select a category to view news articles from that category.
- Scroll through the articles using the carousel slider.
- Tap on an article to view it within the app using the built-in web view.

## Screenshots

![Home_Screen](https://github.com/nith-in7/news_app/assets/124262214/90a298e9-999c-432d-80fb-0c9d3927a57a)
![Category_List](https://github.com/nith-in7/news_app/assets/124262214/a0ef6222-e93a-4985-bea9-b01870bbeec0)
![Webview](https://github.com/nith-in7/news_app/assets/124262214/35591ce8-482b-40e4-874b-3c511f344b7f)



## Live Video

![Demo](https://github.com/nith-in7/news_app/assets/124262214/42762f53-0542-4493-930a-49ba490ba460)


## Note: WebView Compatibility

Please note that the WebView functionality in this project currently works only on Android. iOS support will be added in future updates.


## Contributing

Contributions are welcome! If you have any suggestions, improvements, or feature requests, feel free to open an issue or create a pull request.

