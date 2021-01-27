import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final Function(String direction) _click;

  Buttons(this._click);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Positioned(
            left: screenWidth / 4,
            child: FlatButton(
              color: Colors.black,
              onPressed: () {
                _click('left');
              },
              child: Icon(
                Icons.arrow_forward, //left
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: (screenWidth / 4) * 2,
            child: FlatButton(
              color: Colors.black,
              onPressed: () {
                _click('top');
              },
              child: Icon(
                Icons.arrow_upward, //top
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: (screenWidth / 4) * 3,
            child: FlatButton(
              color: Colors.black,
              onPressed: () {
                _click('down');
              },
              child: Icon(
                Icons.arrow_downward, //down
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
          FlatButton(
            color: Colors.black,
            onPressed: () {
              _click('right');
            },
            child: Icon(
              Icons.arrow_back, //right
              size: 50,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
