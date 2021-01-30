import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  bool running;
  BodySnakeModel _headSnake;
  SnakeModel _snakeModel;
  FoodModel _foodModel;

  void _newGame() {
    running = false;
    _headSnake = new BodySnakeModel(null, Colors.black45, 'left');
    _foodModel = new FoodModel(_headSnake);
    _snakeModel = new SnakeModel(_headSnake, _foodModel, _newGame);
  }

  void _gameLoop() async {
    while (running) {
      setState(() {
        _headSnake.walk();
      });
      _snakeModel.checkEatFood();
      _headSnake.atualizarDirection();
      _snakeModel.checkHitWall();
      _snakeModel.checkHitBody();
      await Future.delayed(Duration(milliseconds: 200), () {});
    }
  }

  void _click(String direction) {
    if (!running) {
      running = true;
      _gameLoop();
    }
    setState(() {
      if (direction != _headSnake.getDirection()) {
        _headSnake.setDirection(direction);
      }
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
                      snakeModel: _snakeModel,
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
