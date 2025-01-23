import 'package:flutter/material.dart';

import 'info_paint.dart';

/// A widget that displays a customizable info shape.
///
/// The [InfoShape] widget uses the [CustomPaint] widget to draw an info icon
/// shape. You can customize its size and color.
///
/// ### Parameters:
/// - [color]: The color of the info icon. Defaults to `null`, which uses the default paint settings.
/// - [size]: The size (width and height) of the widget. Defaults to `20.0`.
class InfoShape extends StatelessWidget {
  /// The color of the info icon shape.
  final Color? color;

  /// The size of the info icon shape, specifying both its width and height.
  final double size;

  /// Creates an [InfoShape] with an optional [color] and [size].
  const InfoShape({super.key, this.color, this.size = 20.0});

  /// Builds the [InfoShape] widget tree.
  ///
  /// This consists of:
  /// - A [SizedBox] to constrain the widget's size.
  /// - A [CustomPaint] widget that uses [InfoPaint] to draw the shape.
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size, // Width of the info icon shape.
      height: size, // Height of the info icon shape.
      child: CustomPaint(
        painter: InfoPaint(color: color), // Custom painter for the info icon.
      ),
    );
  }
}
