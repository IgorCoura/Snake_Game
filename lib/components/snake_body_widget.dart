import 'package:flutter/material.dart';
import 'package:snake_game/models/body_snake_model.dart';

class SnakeBodyWidget extends StatelessWidget {
  final BodySnakeModel bodySnakeModel;

  SnakeBodyWidget({
    @required this.bodySnakeModel,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: bodySnakeModel.top,
      left: bodySnakeModel.left,
      child: Container(
        width: 10,
        height: 10,
        color: bodySnakeModel.color,
      ),
    );
  }
}
