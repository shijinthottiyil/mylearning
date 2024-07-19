import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylearning/features/form_validation/bloc/form_validation_bloc.dart';
import 'package:mylearning/features/form_validation/view/success_view.dart';

class FormValidationView extends StatefulWidget {
  const FormValidationView({super.key});

  @override
  State<FormValidationView> createState() => _FormValidationViewState();
}

class _FormValidationViewState extends State<FormValidationView> {
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    const kHeight8 = const SizedBox(height: 8);
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Validation BLoC'),
      ),
      body: BlocListener<FormValidationBloc, FormValidationState>(
        listener: (context, state) {
          if (state is FormValidationErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.errorMessage}'),
              ),
            );
          }
          if (state is FormValidationSuccessState) {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context) {
                return SuccessView();
              },
            ), (route) => false);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              TextField(
                controller: _nameEditingController,
                decoration: InputDecoration.collapsed(hintText: 'Enter Name'),
              ),
              kHeight8,
              kHeight8,
              TextField(
                controller: _passwordEditingController,
                decoration:
                    InputDecoration.collapsed(hintText: 'Enter Password'),
              ),
              kHeight8,
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<FormValidationBloc>().add(CheckFormValidation(
              name: _nameEditingController.text,
              password: _passwordEditingController.text));
        },
        child: Icon(Icons.done),
      ),
    );
  }
}
