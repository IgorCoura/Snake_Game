import 'package:flutter/material.dart';
import 'package:snake_game/models/food_model.dart';

import 'body_snake_model.dart';

class SnakeModel {
  final BodySnakeModel _head;
  final FoodModel _food;
  final Function() _restart;
  double _screenMaxHeight;
  double _screenMaxWidth;

  SnakeModel(this._head, this._food, this._restart);

  void setScreenDimesions(double screenMaxHeight, double screenMaxWidth) {
    _screenMaxHeight = screenMaxHeight;
    _screenMaxWidth = screenMaxWidth;
  }

  void incrementBody() {
    BodySnakeModel _current = _head;
    while (_current.getNextBody() != null) {
      _current = _current.getNextBody();
    }
    _current.setNextBody(
        new BodySnakeModel(_current, Colors.black, _current.getDirection()));
    _current.getNextBody().setPosition();
  }

  List<BodySnakeModel> buildSnakeBody() {
    List<BodySnakeModel> _body = [];
    _body.add(_head);
    BodySnakeModel _current = _head.getNextBody();
    while (_current != null) {
      _body.add(_current);
      _current = _current.getNextBody();
    }
    return _body;
  }

  void checkEatFood() {
    if (_head.left == _food.left && _head.top == _food.top) {
      _food.changeLocation();
      incrementBody();
    }
  }

  void checkHitBody() {
    BodySnakeModel _current = _head.getNextBody();
    while (_current != null) {
      if (_head.top == _current.top && _head.left == _current.left) {
        _restart();
      }
      _current = _current.getNextBody();
    }
  }

  void checkHitWall() {
    if (_head.top < 0 ||
        _head.left < 0 ||
        _head.top >= _screenMaxHeight ||
        _head.left >= _screenMaxWidth) {
      _restart();
    }
  }
}
