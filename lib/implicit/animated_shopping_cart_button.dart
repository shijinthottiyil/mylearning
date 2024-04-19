import 'package:flutter/material.dart';

class AnimatedShoppingCartButtonWidget extends StatefulWidget {
  const AnimatedShoppingCartButtonWidget({super.key});

  @override
  State<AnimatedShoppingCartButtonWidget> createState() =>
      _AnimatedShoppingCartButtonWidgetState();
}

class _AnimatedShoppingCartButtonWidgetState
    extends State<AnimatedShoppingCartButtonWidget> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isAdded = !isAdded;
            });
          },
          child: AnimatedContainer(
            duration: Durations.extralong4,
            alignment: Alignment.center,
            width: isAdded ? 200 : 100,
            height: 100,
            decoration: BoxDecoration(
              color: isAdded ? Colors.greenAccent : Colors.redAccent,
              borderRadius: isAdded ? BorderRadius.circular(30) : null,
            ),
            child: isAdded ? Text('Added') : Icon(Icons.shopping_cart),
          ),
        ),
      ),
    );
  }
}
