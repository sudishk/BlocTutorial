import 'package:block_app/user_api_events.dart';
import 'package:block_app/user_api_state.dart';
import 'package:block_app/user_details/user_firebase_events.dart';
import 'package:block_app/user_details/user_firebase_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserFirebaseBloc extends Bloc<UserFirebaseEvents, UserFirebaseState>{
  UserFirebaseBloc():super(UserFirebaseState(message: "Api not called")){
    on<GetFirebaseUserEvent>((event, emit) async {
      try{
        emit(UserFirebaseLoadingState(message: "Data Loading"));
        var response =await FirebaseFirestore.instance.collection("users").get();
        var data = response.docs.map((e) => e.data(),).toList();
        emit(UserFirebaseLoadedState(message: "Data loaded", users: data));
      }catch(error){
        emit(UserFirebaseErrorState(message: "Error", error: "$error"));
      }    },);
  }



}