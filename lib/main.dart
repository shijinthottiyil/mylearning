import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylearning/features/form_validation/bloc/form_validation_bloc.dart';
import 'package:mylearning/features/form_validation/view/form_validation_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => FormValidationBloc()),
      ],
      child: MaterialApp(
        home: FormValidationView(),
      ),
    );
  }
}
