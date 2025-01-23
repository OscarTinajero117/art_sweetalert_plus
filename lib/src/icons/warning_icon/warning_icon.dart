import 'package:flutter/material.dart';

import '../circle_paint.dart';
import 'warning_shape.dart';

/// A widget that displays an animated warning icon with a circular background.
///
/// The [WarningIcon] class uses an animation to scale the warning icon,
/// creating a pulsing effect. It also incorporates a custom-painted circle
/// as the background for the warning shape.
///
/// ### Parameters:
/// - [size]: The size of the warning icon. This determines both the width and
///   height of the icon. Defaults to 80.0.
///
/// ### Features:
/// - Smooth scaling animation using [AnimationController].
/// - Custom-painted circular background with a soft gradient effect.
/// - Easily customizable size and animation behavior.
class WarningIcon extends StatefulWidget {
  /// The size (width and height) of the warning icon.
  final double size;

  /// Creates a [WarningIcon] with an optional [size] parameter.
  const WarningIcon({super.key, this.size = 80.0});

  @override
  _WarningIconState createState() => _WarningIconState();
}

class _WarningIconState extends State<WarningIcon>
    with SingleTickerProviderStateMixin {
  /// The animation controller for scaling the warning icon.
  late AnimationController _iconAnimationController;

  /// The animation that controls the scaling effect.
  late Animation<double> _iconAnimation;

  /// Initializes the animation controller and its scaling animation.
  @override
  void initState() {
    super.initState();

    // Initialize the animation controller with an 800-millisecond duration.
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    // Define a tween animation that scales between 2 and 1.
    _iconAnimation =
        Tween<double>(begin: 2, end: 1).animate(_iconAnimationController)
          ..addListener(() {
            setState(() {});
          });

    // Start the animation.
    _iconAnimationController.forward();
  }

  /// Disposes of the animation controller when the widget is removed.
  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  /// Builds the warning icon widget tree.
  ///
  /// The widget consists of:
  /// - A [SizedBox] to constrain the size.
  /// - A [CustomPaint] widget to draw the circular background using [CirclePaint].
  /// - A [ScaleTransition] to animate the scaling of the [WarningShape].
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size, // Set the width of the warning icon.
      height: widget.size, // Set the height of the warning icon.
      child: CustomPaint(
        // Paint the circular background.
        foregroundPainter: CirclePaint(
          rate: 100,
          strokeWidth: 3.0,
          fillColor: Color.fromRGBO(250, 206, 168, 0.8),
          color: Color.fromRGBO(135, 173, 189, 0),
        ),
        // Scale the warning shape with the animation.
        child: ScaleTransition(
          scale: _iconAnimation,
          child: WarningShape(
            color: Color.fromRGBO(250, 206, 168, 1),
          ),
        ),
      ),
    );
  }
}
