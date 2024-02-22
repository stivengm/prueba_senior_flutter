import 'package:flutter/material.dart';
import 'package:prueba_senior_flutter_treebu/ui/screens/home_screen/home_screen.dart';
import 'package:prueba_senior_flutter_treebu/ui/screens/login_screen/login_screen.dart';

Map<String, WidgetBuilder> routesApp() => <String, WidgetBuilder> {

  'login': ( _ ) => const LoginScreen(),
  'home': ( _ ) => const HomeScreen(),

};