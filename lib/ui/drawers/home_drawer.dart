import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_senior_flutter_treebu/core/blocs/login/login_bloc.dart';

import 'package:prueba_senior_flutter_treebu/core/models/menu_drawer_items.dart';

class HomeDrawer extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;


  const HomeDrawer({super.key, required this.scaffoldKey});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        Navigator.pop(context);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [

        Container(
          height: 200.0,
          width: 100.0,
          decoration: const BoxDecoration(
            color: Colors.grey,
            // borderRadius: BorderRadius.circular(100)
          ),
        ),
        const SizedBox(height: 10.0),
        context.select(
          (LoginBloc loginBloc) => Text("${loginBloc.state.user?.email}", textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineMedium!.copyWith( fontSize: 16.0 ),)
        ),
                
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),
                
        ...appMenuItems
        .map((item) => NavigationDrawerDestination(
          icon: Icon( item.icon ), label: Text(item.title))
        ),
        
      ]
    );
  }
}