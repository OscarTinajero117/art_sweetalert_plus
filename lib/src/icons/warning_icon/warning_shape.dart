import 'package:flutter/widgets.dart';

import 'warning_paint.dart'; // Importing the custom painter for the warning shape.

/// A stateless widget that renders a warning shape using a custom painter.
///
/// The [WarningShape] widget uses the [WarningPaint] class to draw a custom
/// warning shape on a canvas. It provides properties for customization such as
/// the color and size of the shape.
///
/// ### Parameters:
/// - [color]: The color of the warning shape (default is `null`).
/// - [size]: The width and height of the warning shape (default is 20.0).
///
/// ### Features:
/// - Uses [CustomPaint] to render a warning symbol.
/// - Customizable size and color.
/// - Easy integration into Flutter widget trees.
class WarningShape extends StatelessWidget {
  /// The color of the warning shape. Defaults to `null`, which lets the painter use its default color.
  final Color? color;

  /// The size (width and height) of the warning shape. Defaults to `20.0`.
  final double size;

  /// Creates a [WarningShape] with optional color and size parameters.
  ///
  /// - [color]: Sets the color of the warning shape.
  /// - [size]: Sets the width and height of the warning shape (default is 20.0).
  const WarningShape({
    super.key,
    this.color,
    this.size = 20.0,
  });

  /// Builds the widget tree for the warning shape.
  ///
  /// The widget uses a [SizedBox] to constrain the size of the shape and a
  /// [CustomPaint] to render the shape using the [WarningPaint] painter.
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size, // Set the width of the warning shape.
      height: size, // Set the height of the warning shape.
      child: CustomPaint(
        painter: WarningPaint(
            color: color), // Use the WarningPaint class to draw the shape.
      ),
    );
  }
}
