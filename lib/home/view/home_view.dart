import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              // padding: EdgeInsets.symmetric(horizontal: 50),
              width: double.infinity,
              height: 150,
              // color: Colors.red,
              child: Row(
                children: [
                  Image.asset('assets/images/logo.png'),
                  const Spacer(),
                  const Text(
                    'Episodes',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Text(
                    'About',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            SizedBox(
              width: double.infinity,
              height: 400,
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'FLUTTER WEB.\nTHE BASICS',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 80,
                              height: 0.9),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'In this course we will go over the basics of using Flutter Web for website development. Topics will include Responsive Layout, Deploying, Font Changes, Hover Functionality, Modals and more.',
                          style: TextStyle(fontSize: 21, height: 1.7),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 31, 229, 146),
                          borderRadius: BorderRadius.circular(5)),
                      alignment: Alignment.center,
                      width: 200,
                      height: 50,
                      child: const Text(
                        'Join course',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ))
                ],
              ),
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
