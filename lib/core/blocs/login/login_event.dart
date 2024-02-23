part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class HandleLogin extends LoginEvent {
  final bool isLoading;
  const HandleLogin(this.isLoading);
}

class LoginUser extends LoginEvent {
  final UserModel user;
  const LoginUser(this.user);
}