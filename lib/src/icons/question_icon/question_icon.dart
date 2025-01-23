import 'package:flutter/material.dart';

import '../circle_paint.dart';
import 'question_shape.dart';

class QuestionIcon extends StatefulWidget {
  final double size;

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
    _iconAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    _iconAnimation =
        Tween<double>(begin: 0, end: 1.0).animate(_iconAnimationController)
          ..addListener(() {
            setState(() {});
          });

    _iconAnimationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: CustomPaint(
        foregroundPainter: CirclePaint(
            rate: 100,
            strokeWidth: 3.0,
            fillColor: Color.fromRGBO(135, 173, 189, 0.5),
            color: Color.fromRGBO(135, 173, 189, 0)),
        child: QuestionShape(
          color: Color.fromRGBO(135, 173, 189, _iconAnimation.value),
        ),
      ),
    );
  }
}
