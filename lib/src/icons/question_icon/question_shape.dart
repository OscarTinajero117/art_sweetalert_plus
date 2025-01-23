import 'package:flutter/widgets.dart';

import 'question_paint.dart';

class QuestionShape extends StatelessWidget {
  final Color? color;
  final double size;

  const QuestionShape({super.key, this.color, this.size = 20.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: QuestionPaint(color: color),
      ),
    );
  }
}
