import 'dart:async';

import 'package:flutter/material.dart';

import '../circle_paint.dart';

/// A widget that displays an animated error icon with a circular progress bar.
///
/// The [ErrorIcon] widget uses the [CustomPaint] widget to draw a circular progress
/// and the error icon inside it. It has two animations: one for the circle and another
/// for the icon size. The animations are triggered sequentially.
///
/// ### Parameters:
/// - [size]: The size (width and height) of the widget. Defaults to `80.0`.
class ErrorIcon extends StatefulWidget {
  /// The size of the error icon, specifying both its width and height.
  final double size;

  /// Creates an [ErrorIcon] with a specified [size].
  const ErrorIcon({super.key, this.size = 80.0});

  @override
  _ErrorIconState createState() =>
      _ErrorIconState(); // Creates the state for the widget
}

class _ErrorIconState extends State<ErrorIcon> with TickerProviderStateMixin {
  late AnimationController
      _circleAnimationController; // Controller for the circular progress animation
  late Animation<double>
      _circleAnimation; // Animation controlling the circle's progress

  late AnimationController
      _iconAnimationController; // Controller for the icon's size animation
  late Animation<double>
      _iconAnimation; // Animation controlling the icon's size

  late Timer
      _forwardTimer; // Timer to delay the start of the circular animation

  @override
  void initState() {
    super.initState();

    // Initializes the animation controller for the circular progress with a duration of 100 ms
    _circleAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));

    // Creates an animation for the circular progress, from 100% to 0%
    _circleAnimation = Tween<double>(begin: 100.0, end: 0.0)
        .animate(_circleAnimationController)
      ..addListener(() {
        setState(() {}); // Rebuilds the widget on each animation frame
        if (_circleAnimationController.isCompleted) {
          // Starts the icon size animation once the circle animation is complete
          _iconAnimationController.forward();
        }
      });

    // Initializes the animation controller for the icon's size with a duration of 100 ms
    _iconAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));

    // Creates an animation for the icon's size, from a smaller value to a larger value based on widget size
    _iconAnimation = Tween<double>(
            begin: (widget.size * 37.5) / 100, end: (widget.size * 75) / 100)
        .animate(_iconAnimationController)
      ..addListener(() {
        setState(() {}); // Rebuilds the widget on each animation frame
      });

    // Sets a timer to start the circle animation after 500 ms
    _forwardTimer = Timer(Duration(milliseconds: 500), () {
      _circleAnimationController.forward();
    });
  }

  @override
  void dispose() {
    _circleAnimationController
        .dispose(); // Disposes the circle animation controller
    _iconAnimationController
        .dispose(); // Disposes the icon animation controller
    _forwardTimer.cancel(); // Cancels the forward timer
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // The widget is a SizedBox with the specified size
    return SizedBox(
      width: widget.size, // Sets the width based on the provided size
      height: widget.size, // Sets the height based on the provided size
      child: CustomPaint(
        // Custom painter for the circular progress animation
        foregroundPainter: CirclePaint(
          rate: _circleAnimation
              .value, // Progress value for the circular animation
          strokeWidth: 6.0, // Thickness of the circle
          fillColor: Color.fromRGBO(242, 116, 116, 0), // Transparent fill color
          color: Color.fromRGBO(
              242, 116, 116, 1), // Red color for the circle stroke
        ),
        child: Icon(
          Icons.close, // Displays the error icon (close icon)
          size:
              _iconAnimation.value, // Icon size is controlled by the animation
          color: Color.fromRGBO(242, 116, 116, 1), // Red color for the icon
        ),
      ),
    );
  }
}
