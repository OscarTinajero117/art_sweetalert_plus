import 'dart:async';

import 'package:flutter/material.dart';

import '../circle_paint.dart';

/// A widget that displays an animated success icon with a dynamic circular background.
///
/// The [SuccessIcon] uses multiple animations to create a smooth effect:
/// - A circular background that "fills up" using an animated stroke.
/// - A checkmark icon that grows in size after the circle animation completes.
///
/// ### Parameters:
/// - [size]: The size of the success icon, determining both its width and height. Defaults to 80.0.
///
/// ### Features:
/// - Two separate animations: one for the circular background and one for the checkmark.
/// - Custom timing for triggering the animations in sequence.
/// - Easily customizable size and animation behavior.
class SuccessIcon extends StatefulWidget {
  /// The size (width and height) of the success icon.
  final double size;

  /// Creates a [SuccessIcon] with an optional [size] parameter.
  const SuccessIcon({super.key, this.size = 80.0});

  @override
  _SuccessIconState createState() => _SuccessIconState();
}

class _SuccessIconState extends State<SuccessIcon>
    with TickerProviderStateMixin {
  /// Controller for animating the circular background.
  late AnimationController _circleAnimationController;

  /// Animation controlling the stroke completion of the circular background.
  late Animation<double> _circleAnimation;

  /// Controller for animating the size of the checkmark icon.
  late AnimationController _iconAnimationController;

  /// Animation controlling the size of the checkmark icon.
  late Animation<double> _iconAnimation;

  /// Timer to delay the start of the circle animation.
  late Timer _forwardTimer;

  /// Initializes the animation controllers and sets up the animation sequences.
  @override
  void initState() {
    super.initState();

    // Initialize the circle animation controller with a 300ms duration.
    _circleAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    // Define the circle animation to "fill" from 0 to 100%.
    _circleAnimation =
        Tween<double>(begin: 0, end: 100.0).animate(_circleAnimationController)
          ..addListener(() {
            setState(() {});

            // Trigger the icon animation when the circle animation completes.
            if (_circleAnimationController.isCompleted) {
              _iconAnimationController.forward();
            }
          });

    // Initialize the icon animation controller with a 100ms duration.
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );

    // Define the icon animation to grow the checkmark size.
    _iconAnimation = Tween<double>(
      begin: (widget.size - 30),
      end: (widget.size - 20),
    ).animate(_iconAnimationController)
      ..addListener(() {
        setState(() {});
      });

    // Delay the start of the circle animation by 500ms.
    _forwardTimer = Timer(Duration(milliseconds: 500), () {
      _circleAnimationController.forward();
    });
  }

  /// Disposes of the animation controllers and cancels the timer to avoid memory leaks.
  @override
  void dispose() {
    _circleAnimationController.dispose();
    _iconAnimationController.dispose();
    _forwardTimer.cancel();
    super.dispose();
  }

  /// Builds the success icon widget tree.
  ///
  /// The widget consists of:
  /// - A [SizedBox] to constrain the size of the entire widget.
  /// - A [CustomPaint] widget to draw the animated circular background.
  /// - An [Icon] widget representing the checkmark, animated to grow in size.
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size, // Width of the success icon.
      height: widget.size, // Height of the success icon.
      child: CustomPaint(
        // Paint the animated circular background.
        foregroundPainter: CirclePaint(
          rate: _circleAnimation.value, // Progress of the circle animation.
          strokeWidth: 3.0,
          fillColor: Color.fromRGBO(165, 220, 134, 0.3),
          color: Color.fromRGBO(165, 220, 134, 1.0),
        ),
        // Display the animated checkmark icon.
        child: Icon(
          Icons.check,
          size:
              _iconAnimation.value, // Size of the icon based on the animation.
          color: _iconAnimation.isCompleted
              ? Color.fromRGBO(
                  165, 220, 134, 1.0) // Final color after animation.
              : Color.fromRGBO(165, 220, 134, 0.3), // Initial faded color.
        ),
      ),
    );
  }
}
