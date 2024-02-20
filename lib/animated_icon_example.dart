import 'package:flutter/material.dart';

class AnimatedIconExample extends StatefulWidget {
  const AnimatedIconExample({super.key});

  @override
  State<AnimatedIconExample> createState() => _AnimatedIconExampleState();
}

class _AnimatedIconExampleState extends State<AnimatedIconExample> {
  bool isAnimating = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isAnimating = !isAnimating;
            });
          },
          child: AnimatedContainer(
            width: isAnimating ? 100 : 50,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: isAnimating
                  ? BorderRadius.circular(24)
                  : BorderRadius.circular(8),
              color: isAnimating ? Colors.greenAccent : Colors.red,
            ),
            duration: const Duration(milliseconds: 500),
            child: isAnimating
                ? Text(
                    'Done',
                    textAlign: TextAlign.center,
                  )
                : Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
