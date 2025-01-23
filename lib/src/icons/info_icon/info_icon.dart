import 'package:flutter/material.dart';

import '../circle_paint.dart';
import 'info_shape.dart';

/// A widget that displays an animated info icon with a circular progress bar.
///
/// The [InfoIcon] widget uses the [CustomPaint] widget to draw a circular progress
/// and the info icon inside it. It features an animation that controls the icon's
/// opacity and shows the circular progress as the animation runs.
///
/// ### Parameters:
/// - [size]: The size (width and height) of the widget. Defaults to `80.0`.
class InfoIcon extends StatefulWidget {
  /// The size of the info icon, specifying both its width and height.
  final double size;

  /// Creates an [InfoIcon] with a specified [size].
  const InfoIcon({super.key, this.size = 80.0});

  @override
  _InfoIconState createState() =>
      _InfoIconState(); // Creates the state for the widget
}

class _InfoIconState extends State<InfoIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController
      _iconAnimationController; // Controller for the animation
  late Animation<double>
      _iconAnimation; // Animation controlling the opacity and circular progress

  @override
  void initState() {
    super.initState();

    // Initializes the animation controller with a duration of 1 second (1000 ms)
    _iconAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    // Creates an animation that goes from 0.0 (fully transparent) to 1.0 (fully opaque)
    _iconAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_iconAnimationController)
          ..addListener(() {
            setState(
                () {}); // Rebuilds the widget every time the animation value changes
          });

    // Starts the animation forward
    _iconAnimationController.forward();
  }

  @override
  void dispose() {
    _iconAnimationController
        .dispose(); // Disposes the controller when it's no longer needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // The widget is a SizedBox with the specified size
    return SizedBox(
      width: widget.size, // Sets the width based on the provided size
      height: widget.size, // Sets the height based on the provided size
      child: CustomPaint(
        // Custom painter for the circular progress bar
        foregroundPainter: CirclePaint(
          rate:
              _iconAnimation.value * 100.0, // Progress value based on animation
          strokeWidth: 3.0, // Thickness of the circle
          fillColor: Color.fromRGBO(
              157, 224, 246, 0.8), // Semi-transparent blue fill color
          color: Color.fromRGBO(157, 224, 246, 0.0), // Transparent stroke color
        ),
        child: Opacity(
            opacity: _iconAnimation
                .value, // Sets the opacity based on the animation value
            child: InfoShape(
              color: Color.fromRGBO(
                  157, 224, 246, 1), // Color of the info icon shape
            )),
      ),
    );
  }
}
