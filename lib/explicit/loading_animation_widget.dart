import 'package:flutter/material.dart';

class LoadingAnimationWidget extends StatefulWidget {
  const LoadingAnimationWidget({super.key});

  @override
  State<LoadingAnimationWidget> createState() => _LoadingAnimationWidgetState();
}

class _LoadingAnimationWidgetState extends State<LoadingAnimationWidget>
    with SingleTickerProviderStateMixin {
  final progress = 0.75;
  late final AnimationController loadingAnimationController =
      AnimationController(vsync: this, duration: Duration(seconds: 3));
  late Animation<double> loadingAnimationValue =
      Tween<double>(begin: 0, end: progress)
          .animate(loadingAnimationController);

  @override
  void initState() {
    super.initState();
    loadingAnimationController.forward();
  }

  @override
  void dispose() {
    loadingAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading Animation Widget'),
      ),
      body: Center(
        child: AnimatedBuilder(
            animation: loadingAnimationValue,
            builder: (context, child) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.black12,
                      value: loadingAnimationValue.value,
                      strokeWidth: 8,
                    ),
                  ),
                  Text(
                    '${(loadingAnimationValue.value * 100).toInt()}%',
                    style: Theme.of(context).textTheme.headlineMedium,
                  )
                ],
              );
            }),
      ),
    );
  }
}
