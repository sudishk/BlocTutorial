class UserApiState{
  final String message;
  UserApiState({required this.message});
}

class UserApiLoadingState extends UserApiState{
  UserApiLoadingState({required super.message});
}

class UserApiLoadedState extends UserApiState{
  final List<dynamic> users;
  UserApiLoadedState({required super.message, required this.users});
}

class UserApiErrorState extends UserApiState{
  final String error;
  UserApiErrorState({required super.message, required this.error});
}
