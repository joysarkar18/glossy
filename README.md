## Screenshots

<p align="center">
<img src="https://firebasestorage.googleapis.com/v0/b/gamaru-mobile-app.appspot.com/o/asdasd.png?alt=media&token=fa9b4777-fc45-4481-91db-9faea5d94a9b" alt="App Screenshot" style="width: 25%; margin-right: 10px;">
  
</p>

## Overview

This Flutter package allows you to easily create glass morphism effects in your Flutter applications. Glass morphism is a design trend that involves using blurred, semi-transparent elements to create a frosted glass-like effect.

## Installation

To use this package, add `glossy` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  glossy: ^0.0.3
```

<br>
OR
<br>
<br>
<p>
Open your termilar in the project level and run this command.
  
</p>

```bash
flutter pub add glossy
```

## Usage

You can use the `GlossyContainer` widget provided by this package to create glass morphism effects. Here's a basic example:

```dart
import 'package:flutter/material.dart';
import 'package:glossy/glossy.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Glass Morphism Example'),
        ),
        body: Center(
          child: SizedBox(
            width: 300,
            height: 300,
            child: Stack(
              children: [
                Container(
                  height: 140,
                  width: 140,
                  decoration: (BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(70))),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 140,
                    width: 140,
                    decoration: (BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(70))),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: GlossyContainer(
                    width: 200,
                    height: 200,
                    borderRadius: BorderRadius.circular(12),
                    child: const Center(
                      child: Text(
                        'Glass Morphism',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

## Parameters

- `width`: The width of the container `required`.
- `height`: The height of the container `required`.
- `borderRadius`: The border radius of the container.
- `blur`: The amount of blur to apply to the container.
- `child`: The widget placed inside the glass container.
- `color`: Background color of the container.
- `opacity`: Opacity of the container.
- `strengthX`: Strength of blur in the horizontal direction.
- `strengthY`: Strength of blur in the vertical direction.
- `border`: Border of the container.
- `blendMode`: Blend mode for applying filter.
- `gradient`: Gradient of the container.
- `boxShadow`: Box shadows for the container.
- `image`: Background image of the container.
- `imageOpacity`: Opacity of the background image.

## Support

If you find this project helpful and would like to support its development, you can connect with me on social media:

- [Twitter](https://twitter.com/byteberg)
- [Instagram](https://www.instagram.com/byteberg?igsh=MThrNWNoY2t0ZjNocQ==)
- [LinkedIn](https://www.linkedin.com/in/joy-sarkar-667b47218/)
- [GitHub](https://github.com/joysarkar18)

Your support and feedback are greatly appreciated and will help in further improving this project.
