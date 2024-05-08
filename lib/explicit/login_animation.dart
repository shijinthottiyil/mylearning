import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginAnimation extends StatefulWidget {
  const LoginAnimation({super.key});

  @override
  State<LoginAnimation> createState() => _LoginAnimationState();
}

class _LoginAnimationState extends State<LoginAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController slideAnimationController;
  late final Animation<Offset> slideAnimationValue;

  @override
  void initState() {
    super.initState();
    slideAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    slideAnimationValue =
        Tween<Offset>(begin: Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(
        parent: slideAnimationController,
        curve: Curves.ease,
      ),
    );
    slideAnimationController.forward();
  }

  @override
  void dispose() {
    slideAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen Animation'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SlideTransition(
          position: slideAnimationValue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlutterLogo(
                size: 100,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: 8,
              ),
              TextField(
                decoration:
                    InputDecoration(filled: true, labelText: 'Enter Data'),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: 8,
              ),
              TextField(
                decoration:
                    InputDecoration(filled: true, labelText: 'Enter Data'),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: 16,
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.login_rounded),
                label: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
