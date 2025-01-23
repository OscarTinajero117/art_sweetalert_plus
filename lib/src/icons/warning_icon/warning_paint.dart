import 'package:flutter/material.dart';

/// A custom painter used to draw a warning icon shape.
///
/// The [WarningPaint] class is responsible for rendering a warning icon
/// using a [Canvas]. It provides an optional [color] parameter to customize
/// the fill color of the shape.
class WarningPaint extends CustomPainter {
  /// The fill color of the warning shape.
  final Color? color;

  /// Creates a [WarningPaint] instance with an optional [color] parameter.
  WarningPaint({this.color});

  /// Defines the painting logic for the warning shape.
  ///
  /// This method uses a [Path] to define the shape of the warning icon,
  /// including circular and polygonal elements. The shape is then filled
  /// using the provided [color].
  ///
  /// - [canvas]: The canvas on which the shapes are drawn.
  /// - [size]: The size of the available drawing area.
  @override
  void paint(Canvas canvas, Size size) {
    // Define the path for the warning shape.
    Path path = Path();
    // Draw the bottom circular portion of the warning icon.
    path.moveTo(size.width * 0.4376250, size.height * 0.6875000);
    path.arcToPoint(Offset(size.width * 0.5626250, size.height * 0.6875000),
        radius: Radius.elliptical(
            size.width * 0.06250000, size.height * 0.06250000),
        rotation: 0,
        largeArc: true,
        clockwise: true);
    path.arcToPoint(Offset(size.width * 0.4376250, size.height * 0.6875000),
        radius: Radius.elliptical(
            size.width * 0.06250000, size.height * 0.06250000),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path.close();

    // Draw the upper triangular portion of the warning icon.
    path.moveTo(size.width * 0.4437500, size.height * 0.3121875);
    path.arcToPoint(Offset(size.width * 0.5562500, size.height * 0.3121875),
        radius: Radius.elliptical(
            size.width * 0.05656250, size.height * 0.05656250),
        rotation: 0,
        largeArc: true,
        clockwise: true);
    path.lineTo(size.width * 0.5343750, size.height * 0.5313750);
    path.arcToPoint(Offset(size.width * 0.4656250, size.height * 0.5313750),
        radius: Radius.elliptical(
            size.width * 0.03456250, size.height * 0.03456250),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path.lineTo(size.width * 0.4437500, size.height * 0.3121875);
    path.close();

    // Create a paint object for filling the path.
    Paint paintFill = Paint()..style = PaintingStyle.fill;
    // Apply the specified color to the paint object.
    paintFill.color = color!;
    // Draw the filled path onto the canvas.
    canvas.drawPath(path, paintFill);
  }

  /// Determines whether the canvas should repaint.
  ///
  /// Always returns `true` to allow dynamic updates to the warning icon.
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
