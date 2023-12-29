library glossy;

import 'dart:ui';

import 'package:flutter/material.dart';

class GlossyCard extends StatelessWidget {
  final double height;
  final double width;
  final BorderRadiusGeometry? borderRadius;
  final double? borderWith;
  final Color? color;
  final Widget child;
  final double? strengthX;
  final double? strengthY;
  final BoxBorder? border;

  const GlossyCard({
    super.key,
    required this.height,
    required this.width,
    this.strengthX,
    this.strengthY,
    this.borderRadius,
    this.borderWith,
    this.border,
    this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: Colors.transparent,
      child: Stack(children: [
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: strengthX == null ? 30.0 : strengthX!,
            sigmaY: strengthY == null ? 30 : strengthY!,
          ),
          child: Container(),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: borderRadius,
              border: border,
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    // Color.fromARGB(255, 107, 106, 106).withOpacity(0.153),
                    // Color.fromARGB(255, 88, 88, 88).withOpacity(0.103),
                    color!.withOpacity(0.153),
                    color!.withOpacity(0.153),
                  ])),
        ),
        Container(
          child: child,
        )
      ]),
    );
  }
}
