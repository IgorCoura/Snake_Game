class Snake {
  double screenMaxWidth;
  double screenMaxHeight;
  double top = 0;
  double left = 0;
  double velocity = 2;
  String direction = 'left';

  Snake({this.screenMaxHeight, this.screenMaxWidth});

  void walk() {
    switch (direction) {
      case 'top':
        top -= velocity;
        break;
      case 'down':
        top += velocity;
        break;
      case 'left':
        left += velocity;
        break;
      case 'right':
        left -= velocity;
        break;
    }
  }

  void changeDirection(String newDirection) {
    direction = newDirection;
  }

  void checkBox() {
    if (top < -10 ||
        top > screenMaxHeight ||
        left < -10 ||
        left > screenMaxWidth) {
      velocity = 0;
    }
  }
}
