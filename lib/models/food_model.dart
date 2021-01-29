import 'dart:math';

import 'package:snake_game/models/body_snake_model.dart';

class FoodModel {
  double _top;
  double _left;
  double _screenMaxWidth = 0;
  double _screenMaxHeigth = 0;
  final BodySnakeModel headSnake;
  bool _firstCall = false;
  Random rng = new Random();

  FoodModel(this.headSnake) {
    _firstCall = true;
  }

  void changeLocation() {
    bool verified = false;
    while (!verified) {
      _top = _randomNumber(_screenMaxHeigth);
      _left = _randomNumber(_screenMaxWidth);
      verified = _checkPositionSnake(_top, _left);
    }
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

  void setScreenDimensions(double maxHeight, double maxWidth) {
    _screenMaxHeigth = maxHeight;
    _screenMaxWidth = maxWidth;
    if (_firstCall) {
      changeLocation();
      _firstCall = false;
    }
  }

  bool _checkPositionSnake(double top, double left) {
    BodySnakeModel current = headSnake;
    while (current != null) {
      if (current.top == top && current.left == left) {
        return false;
      }
      current = current.getNextBody();
    }
    return true;
  }
}
