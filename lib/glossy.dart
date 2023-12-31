library glossy;

import 'dart:ui';

import 'package:flutter/material.dart';

class GlossyContainer extends StatelessWidget {
  final double height;
  final double width;
  final BorderRadiusGeometry? borderRadius;
  final double? borderWith;
  final Color? color;
  final double opacity;
  final Widget child;
  final double? strengthX;
  final double? strengthY;
  final BoxBorder? border;
  final BlendMode? blendMode;
  final GlossyGradient? gradient;

  const GlossyContainer({
    super.key,
    required this.height,
    required this.width,
    required this.opacity,
    this.strengthX,
    this.strengthY,
    this.borderRadius,
    this.borderWith,
    this.border,
    this.color,
    this.blendMode,
    this.gradient,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    late LinearGradient lg;
    if (gradient is GlossyGradient) {
      final GlossyLinearGradient glg = gradient as GlossyLinearGradient;
      lg = glg.getLinearGradient(opacity);
    }

    return ClipRect(
      child: Container(
        height: height,
        width: width,
        color: Colors.transparent,
        child: Stack(children: [
          BackdropFilter(
            blendMode: blendMode != null ? blendMode! : BlendMode.srcOver,
            filter: ImageFilter.blur(
              sigmaX: strengthX == null ? 30 : strengthX!,
              sigmaY: strengthY == null ? 30 : strengthY!,
            ),
            child: Container(),
          ),
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              border: border ??
                  Border.all(
                    color: Colors.grey,
                    width: 0.5,
                  ),
              gradient: gradient == null
                  ? LinearGradient(
                      tileMode: TileMode.mirror,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                          // Color.fromARGB(255, 107, 106, 106).withOpacity(0.153),
                          // Color.fromARGB(255, 88, 88, 88).withOpacity(0.103),
                          color!.withOpacity(opacity),
                          Colors.red.withOpacity(opacity)
                        ])
                  : lg,
            ),
          ),
          Container(
            child: child,
          )
        ]),
      ),
    );
  }
}

abstract class GlossyGradient {
  const GlossyGradient({required this.colors});
  final List<Color> colors;
}

class GlossyLinearGradient extends GlossyGradient {
  const GlossyLinearGradient({
    this.begin = Alignment.centerLeft,
    this.end = Alignment.centerRight,
    required super.colors,
    this.tileMode = TileMode.clamp,
  });

  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final TileMode tileMode;

  LinearGradient getLinearGradient(double opacity) {
    return LinearGradient(
        colors: colors.map((e) => e.withOpacity(opacity)).toList(),
        begin: begin,
        end: end,
        tileMode: tileMode);
  }
}
