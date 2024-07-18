import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:mylearning/utils/data_model.dart';
import 'package:path_provider/path_provider.dart';

class CounterStorage {
  static List<DataModel> dataList = [];

  static Future<List<DataModel>> readNotes() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/notes.txt');
      String notes = await file.readAsString();
      var list = notes.split(',').toList();
      log(list.toString(), name: 'data in the list');
      return dataList;
    } catch (e) {
      return dataList;
    }
  }

  static Future<File> saveNotes(DataModel dataModelGet) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/notes.txt');
    final DataModel dataModel = dataModelGet;

    dataList.add(dataModel);
    return file.writeAsString(dataList.toString());
  }
}
