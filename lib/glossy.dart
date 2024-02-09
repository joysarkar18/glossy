library glossy;

import 'dart:ui';

import 'package:flutter/material.dart';

class GlossyContainer extends StatelessWidget {
  final double height;
  final double width;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  final double? opacity;
  final Widget? child;
  final double? strengthX;
  final double? strengthY;
  final BoxBorder? border;
  final BlendMode? blendMode;
  final GlossyGradient? gradient;
  final List<BoxShadow>? boxShadow;

  const GlossyContainer(
      {super.key,
      required this.height,
      required this.width,
      this.opacity,
      this.strengthX,
      this.strengthY,
      this.borderRadius,
      this.border,
      this.color,
      this.blendMode,
      this.gradient,
      this.child,
      this.boxShadow});

  @override
  Widget build(BuildContext context) {
    late LinearGradient lg;
    if (gradient is GlossyGradient) {
      final GlossyLinearGradient glg = gradient as GlossyLinearGradient;
      lg = glg.getLinearGradient();
    }

    return Container(
      decoration: BoxDecoration(
        boxShadow: boxShadow,
        borderRadius: borderRadius,
      ),
      child: ClipRRect(
        borderRadius:
            borderRadius == null ? BorderRadius.circular(0) : borderRadius!,
        child: Container(
          height: height,
          width: width,
          color: Colors.transparent,
          child: Stack(children: [
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
                                ? Color.fromARGB(255, 138, 137, 137)
                                    .withOpacity(opacity ?? 0.15)
                                : color!.withOpacity(opacity ?? 0.15),
                            color == null
                                ? Color.fromARGB(255, 121, 120, 120)
                                    .withOpacity(opacity ?? 0.15)
                                : color!.withOpacity(opacity ?? 0.15),
                            // color!.withOpacity(opacity),
                            // Colors.red.withOpacity(opacity)
                          ])
                    : lg,
              ),
            ),
            Container(
              child: child,
            )
          ]),
        ),
      ),
    );
  }
}

abstract class GlossyGradient {
  const GlossyGradient({required this.colors, required this.opacity});
  final List<Color> colors;
  final double opacity;
}

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

  LinearGradient getLinearGradient() {
    return LinearGradient(
        colors: colors.map((e) => e.withOpacity(opacity)).toList(),
        begin: begin,
        end: end,
        tileMode: tileMode);
  }
}
