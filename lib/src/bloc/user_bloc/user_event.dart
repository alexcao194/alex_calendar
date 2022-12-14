part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UserEventSignUp extends UserEvent {
  final String email;
  final String password;
  final String rePassword;
  const UserEventSignUp({required this.email, required this.password, required this.rePassword});

  @override
  List<Object> get props => [email, password, rePassword];
}

class UserEventRegistry extends UserEvent {
  final String avatarURL;
  final String displayName;
  final String birthday;
  final String nickName;
  const UserEventRegistry({required this.displayName, required this.avatarURL, required this.birthday, required this.nickName});

  @override
  List<Object> get props => [displayName, avatarURL, birthday];
}

class UserEventLogin extends UserEvent {
  final String email;
  final String password;
  const UserEventLogin({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class UserEventGetPassword extends UserEvent {
  final String email;

  const UserEventGetPassword({required this.email});

  @override
  List<Object> get props => [email];
}

class UserEventChangePassword extends UserEvent {
  final String password;
  final String rePassword;
  const UserEventChangePassword({required this.password, required this.rePassword});

  @override
  List<Object> get props => [password, rePassword];
}
