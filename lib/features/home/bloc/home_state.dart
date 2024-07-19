part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeStateLoading extends HomeState {}

final class HomeStateError extends HomeState {}

final class HomeStateSuccess extends HomeState {
  final List<UserModel> userModelList;
  HomeStateSuccess({required this.userModelList});
}
