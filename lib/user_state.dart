class UserState{
  final String name;
  UserState({required this.name});

}

class UserLoadingState extends UserState{
  UserLoadingState({required super.name});

}

class UserLoadedState extends UserState{
  final List<dynamic > users;
  UserLoadedState({required super.name, required this.users});
}

class UserErrorState extends UserState{
  final String error;
  UserErrorState({required super.name, required this.error});

}