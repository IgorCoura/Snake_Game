import 'package:flutter/material.dart';
import 'package:snake_game/models/snake.dart';

class BoardGame extends StatelessWidget {
  final Snake snake;

  BoardGame({
    @required this.snake,
  });
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      snake.screenMaxHeight = constraints.heightConstraints().maxHeight;
      snake.screenMaxWidth = constraints.widthConstraints().maxWidth;
      return Container(
        color: Colors.grey,
        child: CustomPaint(
          painter: FaceOutlinePainter(snake),
        ),
      );
    });
  }
}

class FaceOutlinePainter extends CustomPainter {
  final Snake snake;

  FaceOutlinePainter(this.snake);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.black;

    canvas.drawRect(
      Rect.fromLTWH(snake.left, snake.top, 10, 10),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
