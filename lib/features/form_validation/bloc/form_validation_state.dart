part of 'form_validation_bloc.dart';

@immutable
sealed class FormValidationState {}

final class FormValidationInitial extends FormValidationState {}

final class FormValidationSuccessState extends FormValidationState {}

final class FormValidationErrorState extends FormValidationInitial {
  final String errorMessage;

  FormValidationErrorState({required this.errorMessage});
}
