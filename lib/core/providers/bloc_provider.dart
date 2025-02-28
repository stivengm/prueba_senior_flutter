import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_senior_flutter_treebu/core/blocs/home/home_bloc.dart';
import 'package:prueba_senior_flutter_treebu/core/blocs/login/login_bloc.dart';

final List<BlocProvider> providerBloc = [
  BlocProvider<HomeBloc>(create: ( _ ) => HomeBloc()),
  BlocProvider<LoginBloc>(create: ( _ ) => LoginBloc()),
];