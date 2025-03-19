import 'package:block_app/user_events.dart';
import 'package:block_app/users_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvents, UsersState> {
  UserBloc() : super(UsersState("Ram", "")) {

    on<NextUserEvent>((event, emit) {
      emit(UsersState(event.name, event.email));
    },);

    on<PrevUserEvent>((event, emit) {
      emit(UsersState("Sohan", ""));
    },);
  }
}
