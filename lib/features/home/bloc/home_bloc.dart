import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:mylearning/features/home/model/user_model.dart';
import 'package:mylearning/utils/logic/networking/logger.dart';
import 'package:mylearning/utils/logic/networking/repository/app_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEventDataFetch>(_onHomeEventDataFetch);
  }

  // Method: Fetch UserModel.
  Future<void> _onHomeEventDataFetch(
      HomeEventDataFetch event, Emitter<HomeState> emit) async {
    try {
      emit(HomeStateLoading());
      final response = await AppRepository.get();
      final List responseList = response.data;
      final List<UserModel> userModelList = [];
      for (var i = 0; i < responseList.length; i++) {
        var json = responseList[i];
        userModelList.add(UserModel.fromJson(json));
      }

      emit(HomeStateSuccess(userModelList: userModelList));
    } on DioException catch (dioError) {
      logger.e(dioError.message, error: '_onHomeEventDataFetch DioException');
      HomeStateError();
    } catch (error) {
      HomeStateError();
    }
  }
}
