import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/services.dart';
import 'package:prueba_senior_flutter_treebu/core/models/task_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<HandleTask>((event, emit) {
      emit( state.copyWith( taskList: event.taskList ) );
    });

    readTaskJson();
  }

  Future<void> readTaskJson() async {
    final String response = await rootBundle.loadString('assets/task_list.json');
    final dataJson = jsonDecode(response);
    final List<TaskModel> taskModel = dataJson.map<TaskModel>((m) => TaskModel.fromJson(Map<String, dynamic>.from(m))).toList();

    add( HandleTask(taskModel) );
    print(jsonEncode(taskModel));
  }

}
