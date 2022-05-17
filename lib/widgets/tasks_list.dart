import 'package:flutter/material.dart';
import 'tasks_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tasksList = context.read<Data>().tasks;
    var taskData = context.read<Data>();
    return ListView.builder(
      itemBuilder: (context, index) {
        return TasksTile(
          taskTitle: tasksList[index].name,
          value: tasksList[index].isDone,
          checkboxCallback: (value) {
            taskData.updateTask(tasksList[index]);
          },
          longPress: () {
            taskData.deleteTask(tasksList[index]);
          },
        );
      },
      itemCount: taskData.taskCount,
    );
  }
}
