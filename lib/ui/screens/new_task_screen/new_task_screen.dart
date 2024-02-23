import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_senior_flutter_treebu/core/blocs/home/home_bloc.dart';
import 'package:prueba_senior_flutter_treebu/core/models/task_model.dart';
import 'package:prueba_senior_flutter_treebu/ui/app_style.dart';
import 'package:prueba_senior_flutter_treebu/ui/widgets/primary_button_widget.dart';
import 'package:intl/intl.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameEmployee = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController task = TextEditingController();
  TextEditingController observations = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: backgroundApp,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Crear nueva tarea"),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: nameEmployee,
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => value != null && value == ''  ? 'Ingrese el nombre del empleado' : null,
                  decoration: InputDecoration(
                    labelText: 'Nombre empleado',
                    labelStyle: const TextStyle(color: primaryColor),
                    filled: true,
                    fillColor: whiteColor,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: whiteColor),
                      borderRadius: BorderRadius.circular(10.0)
                    )
                  ),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  controller: date,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.calendar_today),
                    labelText: "Enter Date",
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: whiteColor),
                      borderRadius: BorderRadius.circular(10.0)
                    )
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2100)
                    );

                    if (pickedDate != null) {
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                      setState(() {
                        date.text = formattedDate;
                      });
                    }
                  },
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: task,
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => value != null && value == ''  ? 'Ingrese la tarea' : null,
                  decoration: InputDecoration(
                    labelText: 'Tarea',
                    labelStyle: const TextStyle(color: primaryColor),
                    filled: true,
                    fillColor: whiteColor,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: whiteColor),
                      borderRadius: BorderRadius.circular(10.0)
                    )
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  maxLines: 4,
                  controller: observations,
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    labelText: 'Observaciones',
                    alignLabelWithHint: true,
                    labelStyle: const TextStyle(color: primaryColor),
                    filled: true,
                    fillColor: whiteColor,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: whiteColor),
                      borderRadius: BorderRadius.circular(10.0)
                    )
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  child: PrimaryButton(text: 'Guardar tarea', onPressed: saveTask),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  saveTask() {
    final isValidForm = formKey.currentState!.validate();
    if (!isValidForm) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Faltan campos por llenar")));
    }
    final homeBloc = BlocProvider.of<HomeBloc>(context);

    final taskSaved = TaskModel(
      nameWorker: nameEmployee.text.trim(),
      task: task.text.trim(),
      dateFinish: date.text.trim(),
      observations: observations.text.trim(),
      state: 1,
      id: homeBloc.state.taskList!.length + 1
    );

    final allTask = homeBloc.state.taskList;
    allTask!.add(taskSaved);

    homeBloc.add( HandleTask(allTask) );
    homeBloc.add( const CountRecords(1) );


    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Se agregó la tarea")));

    Navigator.pop(context);
  }

}