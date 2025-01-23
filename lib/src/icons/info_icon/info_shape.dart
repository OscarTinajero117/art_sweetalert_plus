import 'package:flutter/material.dart';

import 'info_paint.dart';

class InfoShape extends StatelessWidget {
  final Color? color;
  final double size;

  const InfoShape({super.key, this.color, this.size = 20.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: InfoPaint(color: color),
      ),
    );
  }
}
