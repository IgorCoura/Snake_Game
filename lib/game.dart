import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:snake_game/components/board_game.dart';
import 'package:snake_game/models/snake.dart';

import 'components/buttons_widget.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  Snake snake = new Snake();

  void _render() {
    Future.delayed(Duration(milliseconds: 16), () {
      setState(() {
        snake.checkBox();
        snake.walk();
        _render();
      });
    });
  }

  void _click(String direction) {
    setState(() {
      snake.changeDirection(direction);
    });
  }

  @override
  void initState() {
    _render();
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
                    child: BoardGame(
                      snake: snake,
                    ),
                  )),
              Container(
                color: Colors.blue[900],
                width: constraints.widthConstraints().maxWidth,
                child: Buttons(_click),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
