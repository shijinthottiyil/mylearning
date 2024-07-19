import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'form_validation_event.dart';
part 'form_validation_state.dart';

class FormValidationBloc
    extends Bloc<FormValidationEvent, FormValidationState> {
  FormValidationBloc() : super(FormValidationInitial()) {
    on<CheckFormValidation>(_checkFormValidation);

    on<LogOutEvent>(_logOutEvent);
  }

  // Method CheckFormValidation
  void _checkFormValidation(
      CheckFormValidation event, Emitter<FormValidationState> emit) {
    try {
      final String name = event.name;
      final String password = event.password;

      if (name.isEmpty ||
          name.length < 4 ||
          password.isEmpty ||
          password.length < 6) {
        throw Exception('Error in Input Data');
      }
      emit(FormValidationSuccessState());
    } catch (error) {
      emit(FormValidationErrorState(errorMessage: error.toString()));
    }
  }

  // LogOutEvent
  void _logOutEvent(LogOutEvent event, Emitter<FormValidationState> emit) {
    emit(FormValidationInitial());
  }
}
