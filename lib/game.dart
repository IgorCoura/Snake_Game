import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:snake_game/components/board_game_widget.dart';
import 'package:snake_game/models/body_snake_model.dart';
import 'package:snake_game/models/food_model.dart';
import 'package:snake_game/models/snake_model.dart';

import 'components/buttons_widget.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  BodySnakeModel _headSnake = new BodySnakeModel(null, Colors.black45, 'right');
  SnakeModel _snakeModel = new SnakeModel();
  FoodModel _foodModel = new FoodModel();

  void _newGame() {
    _snakeModel.incrementBody(_headSnake);
    _snakeModel.incrementBody(_headSnake);
    _snakeModel.incrementBody(_headSnake);
    _snakeModel.incrementBody(_headSnake);
    _snakeModel.incrementBody(_headSnake);
    _snakeModel.incrementBody(_headSnake);
    _snakeModel.incrementBody(_headSnake);
    _snakeModel.incrementBody(_headSnake);
    _snakeModel.incrementBody(_headSnake);
    _snakeModel.incrementBody(_headSnake);
    _snakeModel.incrementBody(_headSnake);
    _snakeModel.incrementBody(_headSnake);
    setState(() {
      _foodModel.changeLocation(_headSnake);
    });
  }

  void _render() {
    Future.delayed(Duration(milliseconds: 1000), () {
      setState(() {});
    });
  }

  void _click(String direction) {
    setState(() {
      _headSnake.atualizarDirection();
      if (direction != _headSnake.getDirection()) {
        _headSnake.setDirection(direction);
      }

      _headSnake.walk();
    });
  }

  @override
  void initState() {
    _newGame();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Snake Game"),
          backgroundColor: Colors.blue[900],
        ),
        body: LayoutBuilder(
          builder: (_, constraints) => Container(
            child: Column(children: [
              Container(
                  width: constraints.widthConstraints().maxWidth,
                  height: constraints.heightConstraints().maxHeight - 66,
                  color: Colors.blue[900],
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: BoardGameWidget(
                      snake: _snakeModel,
                      headSnake: _headSnake,
                      foodModel: _foodModel,
                    ),
                  )),
              Container(
                color: Colors.blue[900],
                width: constraints.widthConstraints().maxWidth,
                child: ButtonsWidget(_click),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
