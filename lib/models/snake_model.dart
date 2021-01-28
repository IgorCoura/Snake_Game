import 'package:flutter/material.dart';

import 'body_snake_model.dart';

class SnakeModel {
  void incrementBody(BodySnakeModel head) {
    double i = 10;
    BodySnakeModel _current = head;
    while (_current.getNextBody() != null) {
      _current = _current.getNextBody();
      i += 10;
    }
    _current.setNextBody(
        new BodySnakeModel(_current, Colors.black, _current.getDirection()));
    _current.getNextBody().setPosition();
  }

  List<BodySnakeModel> buildSnakeBody(BodySnakeModel head) {
    List<BodySnakeModel> _body = [];
    _body.add(head);
    BodySnakeModel _current = head.getNextBody();
    while (_current != null) {
      _body.add(_current);
      _current = _current.getNextBody();
    }
    return _body;
  }
}
