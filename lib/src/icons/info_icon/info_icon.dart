import 'package:flutter/material.dart';

import '../circle_paint.dart';
import 'info_shape.dart';

class InfoIcon extends StatefulWidget {
  final double size;

  const InfoIcon({super.key, this.size = 80.0});

  @override
  _InfoIconState createState() => _InfoIconState();
}

class _InfoIconState extends State<InfoIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;

  @override
  void initState() {
    _iconAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    _iconAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_iconAnimationController)
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
          rate: _iconAnimation.value * 100.0,
          strokeWidth: 3.0,
          fillColor: Color.fromRGBO(157, 224, 246, 0.8),
          color: Color.fromRGBO(157, 224, 246, 0.0),
        ),
        child: Opacity(
            opacity: _iconAnimation.value,
            child: InfoShape(
              color: Color.fromRGBO(157, 224, 246, 1),
            )),
      ),
    );
  }
}
