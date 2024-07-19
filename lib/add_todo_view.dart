import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylearning/cubit/todo_cubit.dart';

class AddToDoView extends StatefulWidget {
  const AddToDoView({super.key});

  @override
  State<AddToDoView> createState() => _AddToDoViewState();
}

class _AddToDoViewState extends State<AddToDoView> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add ToDo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          controller: _textEditingController,
          decoration: InputDecoration.collapsed(hintText: 'Title'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ToDoCubit>().addTodo(title: _textEditingController.text);
          Navigator.pop(context);
        },
        child: Icon(Icons.done),
      ),
    );
  }
}
