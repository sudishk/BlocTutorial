abstract class UserEvent{

}

class ChangeUserEvent extends UserEvent{
  final String newUserName;
  ChangeUserEvent(this.newUserName);
}

class GetUserData extends UserEvent{

}