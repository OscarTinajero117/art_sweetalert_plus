import 'package:flutter/material.dart';

/// A custom painter that draws a question mark shape.
///
/// The [QuestionPaint] class extends [CustomPainter] to draw a question mark
/// using the provided [color] for the paint.
///
/// ### Parameters:
/// - [color]: The color used to paint the question mark shape.
///
/// ### Usage:
/// This class is typically used with a [CustomPaint] widget, where it is assigned
/// as the painter to render the question mark.
///
/// Example:
/// ```dart
/// CustomPaint(
///   painter: QuestionPaint(color: Colors.blue),
/// )
/// ```
class QuestionPaint extends CustomPainter {
  /// The color of the question mark shape.
  final Color? color;

  /// Creates a [QuestionPaint] with the specified [color].
  QuestionPaint({this.color});

  /// Paints the question mark shape onto the provided [canvas] within the given [size].
  ///
  /// The shape is drawn using a series of path operations, including arcs, lines,
  /// and cubic Bézier curves. The shape is filled using the specified [color].
  @override
  void paint(Canvas canvas, Size size) {
    // Create a new path for the question mark shape.
    Path path = Path();

    // Define the top part of the question mark using arcs and lines.
    path.moveTo(size.width * 0.3284375, size.height * 0.3616250);
    path.arcToPoint(Offset(size.width * 0.3435000, size.height * 0.3770625),
        radius: Radius.elliptical(
            size.width * 0.01481250, size.height * 0.01481250),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path.lineTo(size.width * 0.3950625, size.height * 0.3770625);
    path.cubicTo(
        size.width * 0.4036875,
        size.height * 0.3770625,
        size.width * 0.4105625,
        size.height * 0.3700000,
        size.width * 0.4116875,
        size.height * 0.3614375);

    // Add additional cubic Bézier curves to define the main body of the question mark.
    path.cubicTo(
        size.width * 0.4173125,
        size.height * 0.3204375,
        size.width * 0.4454375,
        size.height * 0.2905625,
        size.width * 0.4955625,
        size.height * 0.2905625);
    path.cubicTo(
        size.width * 0.5384375,
        size.height * 0.2905625,
        size.width * 0.5776875,
        size.height * 0.3120000,
        size.width * 0.5776875,
        size.height * 0.3635625);

    // Continue defining the shape.
    path.cubicTo(
        size.width * 0.5776875,
        size.height * 0.4032500,
        size.width * 0.5543125,
        size.height * 0.4215000,
        size.width * 0.5173750,
        size.height * 0.4492500);
    path.cubicTo(
        size.width * 0.4753125,
        size.height * 0.4798125,
        size.width * 0.4420000,
        size.height * 0.5155000,
        size.width * 0.4443750,
        size.height * 0.5734375);

    // Draw the bottom part of the question mark.
    path.lineTo(size.width * 0.4445625, size.height * 0.5870000);
    path.arcToPoint(Offset(size.width * 0.4601875, size.height * 0.6023750),
        radius: Radius.elliptical(
            size.width * 0.01562500, size.height * 0.01562500),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path.lineTo(size.width * 0.5108750, size.height * 0.6023750);
    path.arcToPoint(Offset(size.width * 0.5265000, size.height * 0.5867500),
        radius: Radius.elliptical(
            size.width * 0.01562500, size.height * 0.01562500),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path.lineTo(size.width * 0.5265000, size.height * 0.5801875);

    // Add the dot below the question mark.
    path.moveTo(size.width * 0.4257500, size.height * 0.7218125);
    path.cubicTo(
        size.width * 0.4257500,
        size.height * 0.7551250,
        size.width * 0.4523125,
        size.height * 0.7797500,
        size.width * 0.4888750,
        size.height * 0.7797500);

    path.close();

    // Set up the paint for filling the shape.
    Paint paintFill = Paint()..style = PaintingStyle.fill;
    paintFill.color = color!;

    // Draw the path onto the canvas.
    canvas.drawPath(path, paintFill);
  }

  /// Determines whether the custom painter should repaint when the widget updates.
  ///
  /// Always returns `true` to ensure the canvas is redrawn when necessary.
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
