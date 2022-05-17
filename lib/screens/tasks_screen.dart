import 'package:flutter/material.dart';
import 'package:todoey/widgets/tasks_list.dart';
import 'package:todoey/screens/add_task_screen.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_data.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatefulWidget {
  static String taskText = '';

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    var tasks = context.read<Data>().tasks;
    var tasksData = context.read<Data>();

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          child: const Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => SingleChildScrollView(
                        child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddTasksScreen(
                        onSubmit: () {
                          if (TasksScreen.taskText != null) {
                            setState(() {
                              print(TasksScreen.taskText);
                              TasksScreen.taskText.trim() == ''
                                  ? print('empty')
                                  : tasksData.addTask(TasksScreen.taskText);
                              print(tasks);
                            });
                            Navigator.pop(context);
                          }
                        },
                      ),
                    )));
          }),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(
                      Icons.list,
                      size: 30,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Todoey',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '${Provider.of<Data>(context).taskCount} Tasks',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ]),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: TasksList(),
            ),
          )
        ],
      ),
    );
  }
}
