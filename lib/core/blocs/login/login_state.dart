part of 'login_bloc.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final UserModel? user;
  
  const LoginState({
    this.isLoading = false,
    this.user
  });

  LoginState copyWith({
    bool? isLoading,
    UserModel? user
  }) => LoginState(
    isLoading: isLoading ?? this.isLoading,
    user: user ?? this.user
  );
  
  @override
  List<Object?> get props => [isLoading, user];
}

final class LoginInitial extends LoginState {}
