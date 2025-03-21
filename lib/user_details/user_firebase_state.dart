class UserFirebaseState{
  final String message;

  UserFirebaseState({required this.message});
}

class UserFirebaseLoadingState extends UserFirebaseState{
  UserFirebaseLoadingState({required super.message});
}

class UserFirebaseLoadedState extends UserFirebaseState{
  final List<dynamic> users;
  UserFirebaseLoadedState({required super.message, required this.users});
}

class UserFirebaseErrorState extends UserFirebaseState{
  final String error;
  UserFirebaseErrorState({required super.message,required this.error});

}

