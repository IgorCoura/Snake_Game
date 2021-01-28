import 'dart:math';

import 'package:snake_game/models/body_snake_model.dart';

class FoodModel {
  double _top;
  double _left;
  double _screenMaxWidth = 100;
  double _screenMaxHeigth = 500;
  Random rng = new Random();

  void changeLocation(BodySnakeModel bodySnake) {
    double nextTop;
    double nextLeft;

    while (bodySnake != null) {
      do {
        _top = _randomNumber(_screenMaxWidth);
        _left = _randomNumber(_screenMaxHeigth);
      } while (bodySnake.left == nextLeft && bodySnake.top == nextTop);
      bodySnake = bodySnake.getNextBody();
    }
    print("top: " + _top.toString() + "   left: " + _left.toString());
  }

  double _randomNumber(double maxNum) {
    double number;
    do {
      number = rng.nextInt(maxNum.toInt()).toDouble();
    } while (number % 10 != 0);
    return number;
  }

  double get top {
    return _top;
  }

  double get left {
    return _left;
  }
}
