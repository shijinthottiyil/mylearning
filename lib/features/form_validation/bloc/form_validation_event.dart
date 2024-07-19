part of 'form_validation_bloc.dart';

@immutable
sealed class FormValidationEvent {}

final class CheckFormValidation extends FormValidationEvent {
  final String name;
  final String password;

  CheckFormValidation({required this.name, required this.password});
}

final class LogOutEvent extends FormValidationEvent {}
