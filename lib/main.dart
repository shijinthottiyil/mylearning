import 'package:flutter/material.dart';

/// Flutter code sample for [RawScrollbar].

void main() => runApp(const RawScrollbarExampleApp());

class RawScrollbarExampleApp extends StatelessWidget {
  const RawScrollbarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('RawScrollbar Sample')),
        body: const Center(
          child: RawScrollbarExample(),
        ),
      ),
    );
  }
}

class RawScrollbarExample extends StatefulWidget {
  const RawScrollbarExample({super.key});

  @override
  State<RawScrollbarExample> createState() => _RawScrollbarExampleState();
}

class _RawScrollbarExampleState extends State<RawScrollbarExample> {
  final ScrollController _firstController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Scrollbar(
        interactive: true,
        thumbVisibility: false,
        thickness: 12,
        radius: Radius.circular(16),
        child: ListView.builder(
            primary: true,
            itemCount: 100,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  height: 50,
                  color: index.isEven ? Colors.amberAccent : Colors.blueAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Scrollable 2 : Index $index'),
                  ));
            }),
      );
    });
  }
}
