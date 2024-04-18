import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegeneateColorView extends StatefulWidget {
  const RegeneateColorView({super.key});

  @override
  State<RegeneateColorView> createState() => _RegeneateColorViewState();
}

class _RegeneateColorViewState extends State<RegeneateColorView> {
  var colorList = generateColorList();

  static List<Color> generateColorList() {
    final random = Random();
    return List.generate(
      5,
      (index) => Color.fromRGBO(
          random.nextInt(256), random.nextInt(256), random.nextInt(256), 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Regenerate Color'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (int i = 0; i < colorList.length; i++) ...[
              AnimatedContainer(
                duration: Durations.extralong4,
                margin: EdgeInsets.all(5),
                width: 100,
                height: 100,
                color: colorList[i],
              ),
            ]
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            colorList = generateColorList();
          });
        },
        child: Icon(Icons.restart_alt_rounded),
      ),
    );
  }
}
