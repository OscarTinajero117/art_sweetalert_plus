import 'package:flutter/widgets.dart';

import 'question_paint.dart';

/// A widget that displays a customizable question mark shape.
///
/// The [QuestionShape] uses the [CustomPaint] widget to draw a question mark.
/// It allows customization of its size and color, making it adaptable to different UI needs.
///
/// ### Parameters:
/// - [color]: The color of the question mark. Defaults to `null`, which uses the default paint settings.
/// - [size]: The size (width and height) of the widget. Defaults to `20.0`.
class QuestionShape extends StatelessWidget {
  /// The color of the question mark shape.
  final Color? color;

  /// The size of the question mark shape, specifying both its width and height.
  final double size;

  /// Creates a [QuestionShape] with an optional [color] and [size].
  const QuestionShape({super.key, this.color, this.size = 20.0});

  /// Builds the [QuestionShape] widget tree.
  ///
  /// This consists of:
  /// - A [SizedBox] to constrain the widget's size.
  /// - A [CustomPaint] widget that uses [QuestionPaint] to draw the shape.
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size, // Width of the question mark shape.
      height: size, // Height of the question mark shape.
      child: CustomPaint(
        painter: QuestionPaint(color: color), // Custom painter for the shape.
      ),
    );
  }
}
