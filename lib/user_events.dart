abstract class UserEvents {}

class NextUserEvent extends UserEvents {
  final String name;
  final String email;
  NextUserEvent({required this.name, required this.email});


}

class PrevUserEvent extends UserEvents {}
