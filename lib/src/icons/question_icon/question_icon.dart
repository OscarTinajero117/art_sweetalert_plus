import 'package:flutter/material.dart';

import '../circle_paint.dart';
import 'question_shape.dart';

/// A stateful widget that displays an animated question mark icon.
///
/// The [QuestionIcon] consists of a circular background with a question mark
/// at the center. The question mark fades into view using an animation.
class QuestionIcon extends StatefulWidget {
  /// The size of the icon (width and height of the container).
  final double size;

  /// Creates a [QuestionIcon] with an optional [size], defaulting to `80.0`.
  const QuestionIcon({super.key, this.size = 80});

  @override
  _QuestionIconState createState() => _QuestionIconState();
}

class _QuestionIconState extends State<QuestionIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller with a duration of 800ms.
    _iconAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    // Define a tween animation that transitions the opacity of the question mark.
    _iconAnimation =
        Tween<double>(begin: 0, end: 1.0).animate(_iconAnimationController)
          ..addListener(() {
            setState(() {});
          });

    // Start the animation.
    _iconAnimationController.forward();
  }

  @override
  void dispose() {
    // Dispose of the animation controller when the widget is removed from the tree.
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size, // Width of the icon.
      height: widget.size, // Height of the icon.
      child: CustomPaint(
        // Draw a circular background with a subtle fill.
        foregroundPainter: CirclePaint(
          rate: 100, // Fully render the circle.
          strokeWidth: 3.0, // Width of the circle's stroke.
          fillColor: Color.fromRGBO(
              135, 173, 189, 0.5), // Semi-transparent fill color.
          color: Color.fromRGBO(135, 173, 189, 0), // Transparent stroke color.
        ),
        // Add the animated question mark shape.
        child: QuestionShape(
          color: Color.fromRGBO(135, 173, 189, _iconAnimation.value),
        ),
      ),
    );
  }
}
