import 'package:flutter/material.dart';
import 'package:prueba_senior_flutter_treebu/core/models/task_model.dart';
import 'package:prueba_senior_flutter_treebu/ui/app_style.dart';
import 'package:prueba_senior_flutter_treebu/ui/screens/home_screen/widgets/task_descriptions.dart';

class ItemCardTask extends StatelessWidget {
  final TaskModel task;
  const ItemCardTask({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: Text(task.dateFinish),
              ),
              Container(
                decoration: BoxDecoration(
                  color: task.state == 1 ? Colors.grey.withOpacity(.5) :
                    task.state == 2 ? Colors.blue.withOpacity(.5) : const Color.fromARGB(255, 0, 255, 8).withOpacity(.5),
                  borderRadius: BorderRadius.circular(8.0)
                ),
                padding: const EdgeInsets.only(top: 3.0, right: 5.0, bottom: 3.0, left: 5.0 ),
                child: Text(
                  task.state == 1 ? 'Pendiente' :
                  task.state == 2 ? 'En proceso' : 'Completado',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                    color: task.state == 1 ? const Color.fromARGB(255, 68, 68, 68) : 
                            task.state == 2 ? const Color.fromARGB(255, 16, 78, 129) : const Color.fromARGB(255, 30, 95, 32)
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
                Text(task.nameWorker, style: Theme.of(context).textTheme.headlineMedium!.copyWith( fontSize: 20.0 ),),
                TaskDescriptions(title: 'Tarea', subtitle: task.task),
                TaskDescriptions(title: 'Observaciones', subtitle: task.observations)
              ],
            ),
          ),
        ],
      ),
    );
  }
}