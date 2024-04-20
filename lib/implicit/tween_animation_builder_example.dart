import 'package:flutter/material.dart';

class TweenAnimationBuilderExample extends StatelessWidget {
  const TweenAnimationBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PULSE ANIMATION'),
      ),
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0.0, end: 250.0),
          duration: Durations.extralong4,
          curve: Curves.elasticOut,
          builder: (context, value, _) {
            return Container(
              width: value,
              height: value,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.cyanAccent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent,
                    spreadRadius: value,
                    blurRadius: value,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
