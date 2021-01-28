import 'package:flutter/material.dart';
import 'package:snake_game/models/food_model.dart';

class FoodWidget extends StatelessWidget {
  final FoodModel foodModel;

  FoodWidget({
    @required this.foodModel,
  });
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: foodModel.top,
      left: foodModel.left,
      child: Container(
        width: 10,
        height: 10,
        color: Colors.red[900],
      ),
    );
  }
}
