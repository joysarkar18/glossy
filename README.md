## Screenshots
<p align="center">
<img src="https://firebasestorage.googleapis.com/v0/b/gamaru-mobile-app.appspot.com/o/Screenshot_20240210-130534_Gamaru~2.png?alt=media&token=59cf2608-4e4e-47c2-99b2-8efd76c44fe7" alt="App Screenshot" style="width: 25%; margin-right: 10px;">
  <img src="https://firebasestorage.googleapis.com/v0/b/gamaru-mobile-app.appspot.com/o/Screenshot%20from%202024-02-10%2015-36-04.png?alt=media&token=6269e946-6913-40ac-a4c3-0bf72b5c3f2e" alt="App Screenshot" style="width: 26%; margin-right: 10px;">
<img src="https://firebasestorage.googleapis.com/v0/b/gamaru-mobile-app.appspot.com/o/Screenshot_20240210-130540_Gamaru~2.png?alt=media&token=89cc7b23-e009-4d04-a7ad-91c78f44a86f" alt="App Screenshot" style="width: 25%; margin-left: 5px;">
  
</p>

## Overview

This Flutter package allows you to easily create glass morphism effects in your Flutter applications. Glass morphism is a design trend that involves using blurred, semi-transparent elements to create a frosted glass-like effect.

## Installation

To use this package, add `glossy` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  glossy: ^1.0.0
```
<br>
OR
<br>
<br>
<p>
Open you termilar in the project level and run this command.
  
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
Parameters

- `width`: The width of the container.
- `height`: The height of the container.
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

