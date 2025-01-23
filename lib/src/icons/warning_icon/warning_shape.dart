import 'package:flutter/widgets.dart';

import 'warning_paint.dart';

class WarningShape extends StatelessWidget {
  final Color? color;
  final double size;

  const WarningShape({super.key, this.color, this.size = 20.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: WarningPaint(color: color),
      ),
    );
  }
}
