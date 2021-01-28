import 'package:flutter/material.dart';
import 'package:snake_game/components/food_widget.dart';
import 'package:snake_game/components/snake_body_widget.dart';
import 'package:snake_game/models/body_snake_model.dart';
import 'package:snake_game/models/food_model.dart';
import 'package:snake_game/models/snake_model.dart';

class BoardGameWidget extends StatelessWidget {
  final BodySnakeModel headSnake;
  final SnakeModel snake;
  final FoodModel foodModel;

  BoardGameWidget({
    @required this.snake,
    @required this.headSnake,
    @required this.foodModel,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      double screenMaxHeight = constraints.heightConstraints().maxHeight;
      double screenMaxWidth = constraints.widthConstraints().maxWidth;
      return Container(
        width: screenMaxWidth,
        height: screenMaxHeight,
        color: Colors.grey,
        child: Stack(
          children: [
            FoodWidget(
              foodModel: this.foodModel,
            ),
            Stack(
              children: snake.buildSnakeBody(headSnake).map((b) {
                return SnakeBodyWidget(
                  bodySnakeModel: b,
                );
              }).toList(),
            ),
          ],
        ),
      );
    });
  }
}
