import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mylearning/app_popups.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: context.width,
        height: context.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                AppPopups.successSnackbar(title: 'title', message: 'message');
              },
              child: Text('Success SnackBar'),
            ),
            GestureDetector(
              onTap: () {
                AppPopups.infoSnackbar(title: 'title', message: 'message');
              },
              child: Text('Info SnackBar'),
            ),
            GestureDetector(
              onTap: () {
                AppPopups.successSnackbar(title: 'title', message: 'message');
              },
              child: Text('Warning SnackBar'),
            ),
            GestureDetector(
              onTap: () {
                AppPopups.errorSnackbar(title: 'title', message: 'message');
              },
              child: Text('Error SnackBar'),
            ),
          ],
        ),
      ),
    );
  }
}
