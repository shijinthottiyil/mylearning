import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  // Method To Increment Value Of The Counter By 1 or increment state value by 1.
  void increment() {
    emit(state + 1);
  }
}
