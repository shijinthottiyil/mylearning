import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mylearning/utils/counter_storage.dart';
import 'package:mylearning/utils/data_model.dart';

import 'package:path_provider/path_provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _titleEditingController = TextEditingController();
  DateTime? _dateTime;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await CounterStorage.readNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        /*
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _requestTempDirectory,
                child: const Text(
                  'Get Temporary Directory',
                ),
              ),
            ),
            FutureBuilder<Directory?>(
              future: _tempDirectory,
              builder: _buildDirectory,
            ),
          ],
        ),
        */

        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.greenAccent),
              child: TextField(
                controller: _titleEditingController,
                decoration: InputDecoration.collapsed(hintText: 'Title'),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            /*
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.greenAccent),
              child: TextField(
                decoration: InputDecoration.collapsed(hintText: 'Date'),
                onTap: () async {
                  _dateTime = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1997),
                      lastDate: DateTime.now());
                },
              ),
            ),*/
            GestureDetector(
              onTap: () async {
                _dateTime = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1997),
                    lastDate: DateTime(2025));
                setState(() {});
              },
              child: Container(
                alignment: Alignment.center,
                width: double.maxFinite,
                height: kBottomNavigationBarHeight,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                ),
                child: Text(
                    _dateTime == null ? 'Select Date' : '${_dateTime?.month}'),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () async {
                final DataModel dataModel = DataModel(
                    title: _titleEditingController.text.trim(),
                    createdAt: _dateTime ?? DateTime.now());
                await CounterStorage.saveNotes(dataModel);
                // await saveNotes(_titleEditingController.text.trim());
              },
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 50,
                color: Colors.red,
                child: Text('Add'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
