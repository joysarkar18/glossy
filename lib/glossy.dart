library glossy;

import 'dart:ui';
import 'package:flutter/material.dart';

class GlossyContainer extends StatelessWidget {
  final double height; // Height of the container
  final double width; // Width of the container
  final BorderRadiusGeometry? borderRadius; // Border radius of the container
  final Color? color; // Background color of the container
  final double? opacity; // Opacity of the container
  final Widget? child; // Child widget inside the container
  final double? strengthX; // Strength of blur in the horizontal direction
  final double? strengthY; // Strength of blur in the vertical direction
  final BoxBorder? border; // Border of the container
  final BlendMode? blendMode; // Blend mode for applying filter
  final GlossyGradient? gradient; // Gradient of the container
  final List<BoxShadow>? boxShadow; // Box shadows for the container
  final DecorationImage? image; // Background image of the container
  final double? imageOpacity;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  const GlossyContainer(
      {super.key,
      required this.height,
      required this.width,
      this.margin,
      this.padding,
      this.opacity,
      this.strengthX,
      this.strengthY,
      this.borderRadius,
      this.border,
      this.color,
      this.blendMode,
      this.gradient,
      this.child,
      this.image,
      this.imageOpacity,
      this.boxShadow});

  @override
  Widget build(BuildContext context) {
    late Gradient gradientToApply; // Gradient to apply based on the type

    // Check if the gradient is linear
    if (gradient is GlossyLinearGradient) {
      final GlossyLinearGradient glg = gradient as GlossyLinearGradient;
      gradientToApply = glg.getLinearGradient(); // Get the linear gradient
    }
    // Check if the gradient is radial
    if (gradient is GlossyRadialGradient) {
      final GlossyRadialGradient glg = gradient as GlossyRadialGradient;
      gradientToApply = glg.getRadialGradient(); // Get the radial gradient
    }

    return Container(
      decoration: BoxDecoration(
        boxShadow: boxShadow, // Apply box shadows
        borderRadius: borderRadius, // Apply border radius
      ),
      child: ClipRRect(
        borderRadius:
            borderRadius == null ? BorderRadius.circular(0) : borderRadius!,
        child: Container(
          height: height,
          width: width,
          margin: margin,
          padding: padding,
          color: Colors.transparent,
          child: Stack(children: [
            // Apply backdrop filter for blurring effect
            BackdropFilter(
              blendMode: blendMode != null ? blendMode! : BlendMode.srcOver,
              filter: ImageFilter.blur(
                sigmaX: strengthX == null ? 15 : strengthX!,
                sigmaY: strengthY == null ? 15 : strengthY!,
              ),
              child: Container(),
            ),
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                boxShadow: boxShadow,
                borderRadius: borderRadius,
                border: border ??
                    Border.all(
                      color: Colors.white54,
                      width: 0.5,
                    ),
                gradient: gradient == null
                    ? LinearGradient(
                        tileMode: TileMode.mirror,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                            color == null
                                ? const Color.fromARGB(255, 138, 137, 137)
                                    .withOpacity(opacity ?? 0.15)
                                : color!.withOpacity(opacity ?? 0.15),
                            color == null
                                ? const Color.fromARGB(255, 121, 120, 120)
                                    .withOpacity(opacity ?? 0.15)
                                : color!.withOpacity(opacity ?? 0.15),
                          ])
                    : gradientToApply,
              ),
            ),
            // Apply background image if available
            image != null
                ? Opacity(
                    opacity: imageOpacity == null ? 1 : imageOpacity!,
                    child: Container(
                      height: height,
                      width: width,
                      decoration: BoxDecoration(image: image),
                    ),
                  )
                : const SizedBox(),
            Container(
              child: child,
            )
          ]),
        ),
      ),
    );
  }
}

// Abstract class for defining glossy gradients
abstract class GlossyGradient {
  const GlossyGradient({required this.colors, required this.opacity});
  final List<Color> colors;
  final double opacity;
}

// Class for defining glossy linear gradients
class GlossyLinearGradient extends GlossyGradient {
  const GlossyLinearGradient({
    this.begin = Alignment.centerLeft,
    this.end = Alignment.centerRight,
    required super.colors,
    this.tileMode = TileMode.clamp,
    required super.opacity,
  });

  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final TileMode tileMode;

  // Get linear gradient
  LinearGradient getLinearGradient() {
    return LinearGradient(
        colors: colors.map((e) => e.withOpacity(opacity)).toList(),
        begin: begin,
        end: end,
        tileMode: tileMode);
  }
}

// Class for defining glossy radial gradients
class GlossyRadialGradient extends GlossyGradient {
  const GlossyRadialGradient({
    this.center = Alignment.center,
    this.radius = 0.5,
    required super.colors,
    required super.opacity,
    this.tileMode = TileMode.clamp,
    this.focal,
    this.focalRadius = 0.0,
  });
  final AlignmentGeometry center;
  final double radius;
  final TileMode tileMode;

  final AlignmentGeometry? focal;
  final double focalRadius;

  // Get radial gradient
  RadialGradient getRadialGradient() {
    return RadialGradient(
      colors: colors.map((e) => e.withOpacity(opacity)).toList(),
      center: center,
      focal: focal,
      focalRadius: focalRadius,
      radius: radius,
      tileMode: tileMode,
    );
  }
}
