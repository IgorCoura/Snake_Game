import 'package:flutter/material.dart';

class BodySnakeModel {
  Color color;
  double _top = 0;
  double _left = 0;
  double _velocity = 10;
  BodySnakeModel _nextBody;
  BodySnakeModel _beforeBody;
  String _direction;

  BodySnakeModel(this._beforeBody, this.color, this._direction);

  void walk() {
    switch (_direction) {
      case 'top':
        _top -= _velocity;
        break;
      case 'left':
        _left += _velocity;
        break;
      case 'right':
        _left -= _velocity;
        break;
      case 'down':
        _top += _velocity;
        break;
    }
    if (_nextBody != null) {
      _nextBody.walk();
    }
  }

  void atualizarDirection() {
    if (_nextBody != null) {
      _nextBody.atualizarDirection();
    }
    if (_beforeBody != null) {
      _direction = _beforeBody._direction;
    }
  }

  void setDirection(String direction) {
    this._direction = direction;
  }

  double get top {
    return _top;
  }

  double get left {
    return _left;
  }

  BodySnakeModel getNextBody() {
    return _nextBody;
  }

  void setNextBody(BodySnakeModel bodySnakeModel) {
    _nextBody = bodySnakeModel;
  }

  String getDirection() {
    return _direction;
  }

  void setPosition() {
    switch (_direction) {
      case 'top':
        _top = _beforeBody.top + 10;
        _left = _beforeBody.left;
        break;
      case 'down':
        _top = _beforeBody.top - 10;
        _left = _beforeBody._left;
        break;
      case 'left':
        _left = _beforeBody.left - 10;
        _top = _beforeBody._top;
        break;
      case 'right':
        _left = _beforeBody.left + 10;
        _top = _beforeBody.top;
        break;
    }
  }
}
