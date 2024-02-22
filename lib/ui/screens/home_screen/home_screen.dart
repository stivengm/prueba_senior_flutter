import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_senior_flutter_treebu/core/blocs/home/home_bloc.dart';
import 'package:prueba_senior_flutter_treebu/ui/app_style.dart';
import 'package:prueba_senior_flutter_treebu/ui/drawers/home_drawer.dart';
import 'package:prueba_senior_flutter_treebu/ui/widgets/loader_app_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            child: ListView.builder(
              itemCount: state.taskList!.length,
              itemBuilder: (context, i) => Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3)
                    )
                  ]
                ),
                margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(state.taskList![i].dateFinish),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: state.taskList![i].state == 1 ? Colors.grey.withOpacity(.5) :
                              state.taskList![i].state == 2 ? Colors.blue.withOpacity(.5) : const Color.fromARGB(255, 0, 255, 8).withOpacity(.5),
                            borderRadius: BorderRadius.circular(8.0)
                          ),
                          padding: const EdgeInsets.only(top: 3.0, right: 5.0, bottom: 3.0, left: 5.0 ),
                          child: Text(
                            state.taskList![i].state == 1 ? 'Pendiente' :
                            state.taskList![i].state == 2 ? 'En proceso' : 'Completado',
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              color: state.taskList![i].state == 1 ? const Color.fromARGB(255, 68, 68, 68) : 
                                     state.taskList![i].state == 2 ? const Color.fromARGB(255, 16, 78, 129) : const Color.fromARGB(255, 30, 95, 32)
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(state.taskList![i].nameWorker),
                    Text(state.taskList![i].task),
                    Text(state.taskList![i].observations)
                  ],
                ),
              )
            ),
          ),
        ) : const LoaderApp();
      },
    );
  }
}
