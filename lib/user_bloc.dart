import 'package:block_app/user_events.dart';
import 'package:block_app/user_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState>{
  UserBloc(): super(UserState(name: "Ram")){
    on<ChangeUserEvent>((event, emit) {
      emit(UserState(name: "New User Mohan"));
    },);

    // on<ChangeUserEvent>((event, emit) {
    //   emit(UserState(name: "New User Mohan"));
    // },);

    on<GetUserData>((event, emit) async {
      try {
        emit(UserLoadingState(name: ''));
        var response = await Dio().get('https://jsonplaceholder.typicode.com/users');
        emit(UserLoadedState(name: "",users:  response.data));
      } catch (e) {
        emit(UserErrorState(error:  "Failed to load users", name: ''));
      }
    },);
  }

}