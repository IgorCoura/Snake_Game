import 'package:flutter/material.dart';
import 'package:snake_game/components/food_widget.dart';
import 'package:snake_game/components/snake_body_widget.dart';
import 'package:snake_game/models/body_snake_model.dart';
import 'package:snake_game/models/food_model.dart';
import 'package:snake_game/models/snake_model.dart';

class BoardGameWidget extends StatelessWidget {
  final BodySnakeModel headSnake;
  final SnakeModel snakeModel;
  final FoodModel foodModel;

  BoardGameWidget({
    @required this.snakeModel,
    @required this.headSnake,
    @required this.foodModel,
  });

  double roundDivisibleByTen(int screenMax) {
    while (screenMax % 10 != 0) {
      screenMax--;
    }
    return screenMax.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      double screenMaxHeight = roundDivisibleByTen(
          constraints.heightConstraints().maxHeight.toInt());
      double screenMaxWidth =
          roundDivisibleByTen(constraints.widthConstraints().maxWidth.toInt());
      foodModel.setScreenDimensions(screenMaxHeight, screenMaxWidth);
      snakeModel.setScreenDimesions(screenMaxHeight, screenMaxWidth);
      return Stack(
        children: [
          Center(
            child: Container(
              width: screenMaxWidth,
              height: screenMaxHeight,
              color: Colors.grey,
              child: Stack(
                children: [
                  Stack(
                    children: snakeModel.buildSnakeBody().map((b) {
                      return SnakeBodyWidget(
                        bodySnakeModel: b,
                      );
                    }).toList(),
                  ),
                  FoodWidget(
                    foodModel: this.foodModel,
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
