import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_senior_flutter_treebu/core/blocs/home/home_bloc.dart';
import 'package:prueba_senior_flutter_treebu/core/models/emun_task_state.dart';
import 'package:prueba_senior_flutter_treebu/ui/app_style.dart';
import 'package:prueba_senior_flutter_treebu/ui/drawers/home_drawer.dart';
import 'package:prueba_senior_flutter_treebu/ui/screens/home_screen/widgets/item_card_task.dart';
import 'package:prueba_senior_flutter_treebu/ui/widgets/loader_app_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  StateGroup selectStatusTask = StateGroup.allStates;

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
                      title: const Text("Todas"),
                      value: StateGroup.allStates,
                      groupValue: state.stateTask,
                      onChanged: (value) {
                        context.read<HomeBloc>().add( HandleStateTask( stateTask: value!, taskFilter: state.taskList!) );
                      }
                    ),
                    RadioListTile(
                      title: const Text("Pendiente"),
                      value: StateGroup.statusPending,
                      groupValue: state.stateTask,
                      onChanged: (value) {
                        context.read<HomeBloc>().add( HandleStateTask( stateTask: value!, taskFilter: state.taskList!) );
                      }
                    ),
                    RadioListTile(
                      title: const Text("En proceso"),
                      value: StateGroup.statusInProgress,
                      groupValue: state.stateTask,
                      onChanged: (value) {
                        context.read<HomeBloc>().add( HandleStateTask( stateTask: value!, taskFilter: state.taskList! ) );
                      }
                    ),
                    RadioListTile(
                      title: const Text("Completado"),
                      value: StateGroup.statusComplete,
                      groupValue: state.stateTask,
                      onChanged: (value) {
                        context.read<HomeBloc>().add( HandleStateTask( stateTask: value!, taskFilter: state.taskList! ) );
                      }
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: state.taskFilter!.length,
                  itemBuilder: (context, i) => ItemCardTask(task: state.taskFilter![i])
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
