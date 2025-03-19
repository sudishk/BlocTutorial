abstract class UserEvents {}

class NextUserEvent extends UserEvents {
  final String name;
  final String email;
  NextUserEvent(this.name, this.email);
}

class PrevUserEvent extends UserEvents {}
