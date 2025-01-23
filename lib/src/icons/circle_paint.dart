import 'package:flutter/material.dart';
import 'dart:math' as math;

/// A custom painter for drawing a circular shape with an optional arc.
///
/// The [CirclePaint] class extends [CustomPainter] and is used to render a
/// customizable circle and an arc that visually represents a percentage
/// completion.
///
/// ### Features:
/// - Draws a circular outline with a configurable background color.
/// - Draws an arc over the circle to represent a percentage.
/// - Customizable stroke width, colors, and percentage (`rate`).
///
/// ### Parameters:
/// - [rate]: The percentage of the circle to be covered by the arc (default is 50%).
/// - [strokeWidth]: The thickness of the circle's outline (default is 3.0).
/// - [color]: The color of the arc (default is `Colors.grey`).
/// - [fillColor]: The background color of the circle (default is `Colors.green`).
class CirclePaint extends CustomPainter {
  /// The percentage of the circle to be covered by the arc (0 to 100).
  final double rate;

  /// The thickness of the circle's outline.
  final double strokeWidth;

  /// The color of the arc.
  final Color color;

  /// The background color of the circle.
  final Color fillColor;

  /// Creates a [CirclePaint] instance with customizable properties.
  ///
  /// [rate] defaults to 50%, [strokeWidth] defaults to 3.0, [color] defaults
  /// to `Colors.grey`, and [fillColor] defaults to `Colors.green`.
  CirclePaint({
    this.rate = 50,
    this.strokeWidth = 3.0,
    this.color = Colors.grey,
    this.fillColor = Colors.green,
  });

  /// Paints the circular shape and arc on the provided canvas.
  ///
  /// - [canvas]: The canvas to draw the shapes on.
  /// - [size]: The size of the area available for drawing.
  ///
  /// The circle is drawn first as a background. Then, an arc is calculated
  /// based on the `rate` parameter and drawn over the circle.
  @override
  void paint(Canvas canvas, Size size) {
    // Define the paint object for the circle's background.
    Paint circle = Paint()
      ..color = fillColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    // Define the paint object for the arc.
    Paint arc = Paint()
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke
      ..color = color
      ..strokeCap = StrokeCap.round;

    // Calculate the center of the canvas and the circle's radius.
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = math.min(size.width / 2, size.height / 2) - strokeWidth;

    // Draw the circular outline.
    canvas.drawCircle(center, radius, circle);

    // Calculate the angle for the arc based on the `rate`.
    double angle = 2 * math.pi * ((100 - rate) / 100);

    // Draw the arc over the circle.
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      radius, // Starting angle for the arc.
      angle, // Sweep angle for the arc.
      false, // Do not close the arc (false means stroke only).
      arc, // Paint object for the arc.
    );
  }

  /// Determines whether the canvas needs to repaint.
  ///
  /// Always returns `true` to ensure that the canvas updates whenever
  /// the painter's properties change.
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
