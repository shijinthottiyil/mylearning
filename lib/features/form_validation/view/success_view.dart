import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylearning/features/form_validation/bloc/form_validation_bloc.dart';
import 'package:mylearning/features/form_validation/view/form_validation_view.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<FormValidationBloc, FormValidationState>(
      listener: (context, state) {
        if (state is FormValidationInitial) {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context) {
              return FormValidationView();
            },
          ), (route) => false);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Success'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              context.read<FormValidationBloc>().add(LogOutEvent());
            },
            child: Text('LogOut'),
          ),
        ),
      ),
    );
  }
}
