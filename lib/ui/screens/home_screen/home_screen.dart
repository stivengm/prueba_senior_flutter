import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_senior_flutter_treebu/core/blocs/home/home_bloc.dart';
import 'package:prueba_senior_flutter_treebu/ui/app_style.dart';
import 'package:prueba_senior_flutter_treebu/ui/drawers/home_drawer.dart';
import 'package:prueba_senior_flutter_treebu/ui/screens/home_screen/widgets/item_card_task.dart';
import 'package:prueba_senior_flutter_treebu/ui/widgets/loader_app_widget.dart';

enum StateGroup { statusPending, statusInProgress, statusComplete }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  StateGroup selectStatusTask = StateGroup.statusPending;

  @override
  Widget build(BuildContext context) {

    final scaffoldKey = GlobalKey<ScaffoldState>();

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return state.taskList!.isNotEmpty ? 
        Scaffold(
          backgroundColor: backgroundApp,
          appBar: AppBar(),
          drawer: HomeDrawer(scaffoldKey: scaffoldKey),
          body: RefreshIndicator(
            onRefresh: () {
              return Future.delayed(const Duration(seconds: 2), () {
                1+1;
              });
            },
            child: ListView(
              children: [
                ExpansionTile(
                  title: const Text("Filtrar por estado"),
                  children: [
                    RadioListTile(
                      title: const Text("Pendiente"),
                      value: StateGroup.statusPending,
                      groupValue: selectStatusTask,
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          selectStatusTask = StateGroup.statusPending;
                        });
                      }
                    ),
                    RadioListTile(
                      title: const Text("En proceso"),
                      value: StateGroup.statusInProgress,
                      groupValue: selectStatusTask,
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          selectStatusTask = StateGroup.statusInProgress;
                        });
                      }
                    ),
                    RadioListTile(
                      title: const Text("Completado"),
                      value: StateGroup.statusComplete,
                      groupValue: selectStatusTask,
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          selectStatusTask = StateGroup.statusComplete;
                        });
                      }
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: state.taskList!.length,
                  itemBuilder: (context, i) => ItemCardTask(task: state.taskList![i])
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: primaryColor,
            onPressed: () => Navigator.of(context).pushNamed('newTask'),
            child: const Icon(
              Icons.add,
              color: whiteColor,
            ),
          ),
          
        ) : const LoaderApp();
      },
    );
  }
}
