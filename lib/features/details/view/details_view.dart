import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({
    super.key,
    required this.label,
  });

  /// The label to display in the center of the screen.
  final String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Screen'),
      ),
      body: Center(
        child: Text(
          'Details for $label',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
