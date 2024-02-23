import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_senior_flutter_treebu/core/models/user_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    
    on<HandleLogin>((event, emit) {
      emit( state.copyWith( isLoading: event.isLoading ) );
    });

    on<LoginUser>((event, emit) {
      emit( state.copyWith( user: event.user ) );
    });

  }

}
