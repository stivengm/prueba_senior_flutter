import 'package:flutter/material.dart';
import 'package:prueba_senior_flutter_treebu/ui/drawers/home_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    
    return Scaffold(
      appBar: AppBar(),
      drawer: HomeDrawer(
        scaffoldKey: scaffoldKey
      ),
      body: Placeholder(),
    );
  }
}