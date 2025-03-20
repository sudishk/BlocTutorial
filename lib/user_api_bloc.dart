import 'package:block_app/user_api_events.dart';
import 'package:block_app/user_api_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
class UserApiBloc extends Bloc<UserApiEvent, UserApiState>{
  UserApiBloc(): super(UserApiState(message: "Api not called")){
    on<GetUsers>((event, emit) async {
      try{
        emit(UserApiLoadingState(message: "Loading"));
        var response =await Dio().get("https://jsonplaceholder.typicode.com/users");
        emit(UserApiLoadedState(message: "Data Loaded", users: response.data));
      }catch(error){
        emit(UserApiErrorState(message: "Error", error: "$error"));
      }
    },);
  }
}