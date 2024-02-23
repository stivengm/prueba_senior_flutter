import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_senior_flutter_treebu/core/blocs/home/home_bloc.dart';
import 'package:prueba_senior_flutter_treebu/core/models/task_list.dart';
import 'package:prueba_senior_flutter_treebu/core/models/task_model.dart';
import 'package:prueba_senior_flutter_treebu/ui/app_style.dart';
import 'package:prueba_senior_flutter_treebu/ui/screens/home_screen/widgets/task_descriptions.dart';
import 'package:prueba_senior_flutter_treebu/ui/widgets/primary_button_widget.dart';

class ItemCardTask extends StatefulWidget {
  final TaskModel task;
  const ItemCardTask({super.key, required this.task});

  @override
  State<ItemCardTask> createState() => _ItemCardTaskState();
}

class _ItemCardTaskState extends State<ItemCardTask> {
  var idListChanged = 0;
  void openDialogEditTask( BuildContext context, TaskModel task) {

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Editar tarea", style: Theme.of(context).textTheme.headlineLarge!.copyWith( fontWeight: FontWeight.bold ), textAlign: TextAlign.center,),
        content: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(task.nameWorker, style: Theme.of(context).textTheme.headlineMedium!.copyWith( fontSize: 20.0 ),),
              const SizedBox(height: 2.0),
              TaskDescriptions(title: 'Fecha: ', subtitle: task.dateFinish),
              const SizedBox(height: 10.0),
              TaskDescriptions(title: 'Tarea: ', subtitle: task.task),
              const SizedBox(height: 10.0),
              TaskDescriptions(title: 'Observaciones: ', subtitle: task.observations),
              task.state == 1 || task.state == 2 ?
              DropdownMenu<TaskListModel>(
                initialSelection: listState.first,
                onSelected: (TaskListModel? list) {
                  setState(() {
                    idListChanged = list!.value;
                  });
                },
                dropdownMenuEntries: listState
                    .map<DropdownMenuEntry<TaskListModel>>((TaskListModel list) {
                  return DropdownMenuEntry<TaskListModel>(
                    value: list,
                    label: list.name
                  );
                }).toList(),
              ) : const SizedBox(),
            ],
          ),
        ),
        actions: [
          SizedBox(
            child: PrimaryButton(
              text: task.state == 1 || task.state == 2 ? 'Guardar' : 'Aceptar', 
              onPressed: () {
                if (task.state == 1 || task.state == 2) {
                  final homeBloc = BlocProvider.of<HomeBloc>(context);
                  homeBloc.add( UpdateTaskById(idTaskUpdate: idListChanged, idTask: task.id!, taskFilter: homeBloc.state.taskList!) );
                  Navigator.pop(context);
                } else {
                  Navigator.pop(context);
                }
              }
            ),
          )
        ],
      )
    );

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => openDialogEditTask(context, widget.task),
      child: Container(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(widget.task.dateFinish),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: widget.task.state == 1 ? Colors.grey.withOpacity(.5) :
                      widget.task.state == 2 ? Colors.blue.withOpacity(.5) : const Color.fromARGB(255, 0, 255, 8).withOpacity(.5),
                    borderRadius: BorderRadius.circular(8.0)
                  ),
                  padding: const EdgeInsets.only(top: 3.0, right: 5.0, bottom: 3.0, left: 5.0 ),
                  child: Text(
                    widget.task.state == 1 ? 'Pendiente' :
                    widget.task.state == 2 ? 'En proceso' : 'Completado',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                      color: widget.task.state == 1 ? const Color.fromARGB(255, 68, 68, 68) : 
                              widget.task.state == 2 ? const Color.fromARGB(255, 16, 78, 129) : const Color.fromARGB(255, 30, 95, 32)
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.task.nameWorker, style: Theme.of(context).textTheme.headlineMedium!.copyWith( fontSize: 20.0 ),),
                  TaskDescriptions(title: 'Tarea', subtitle: widget.task.task),
                  TaskDescriptions(title: 'Observaciones', subtitle: widget.task.observations)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}