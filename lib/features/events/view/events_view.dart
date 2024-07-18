import 'package:flutter/material.dart';
import 'package:mylearning/utils/counter_storage.dart';

class EventsView extends StatelessWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          final localData = CounterStorage.dataList[index];
          return ListTile(
            title: Text('${localData.title}'),
            subtitle: Text('${localData.createdAt}'),
          );
        },
        itemCount: CounterStorage.dataList.length,
      ),
    );
  }
}
