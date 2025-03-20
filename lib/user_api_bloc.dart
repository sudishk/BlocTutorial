import 'package:block_app/user_api_events.dart';
import 'package:block_app/user_api_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserApiBloc extends Bloc<UserApiEvents, UserApiState>{
  UserApiBloc():super(UserApiState(message: "Api not called")){
    on<GetUserEvent>((event, emit) async {
      try{
        emit(UserApiLoadingState(message: "Data Loading"));
        var response =await Dio().get("https://jsonplaceholder.typicode.com/users");
        emit(UserApiLoadedState(message: "Data loaded", users: response.data));
      }catch(error){
        emit(UserApiErrorState(message: "Error", error: "$error"));
      }
    },);
  }

}