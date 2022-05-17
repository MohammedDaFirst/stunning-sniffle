import 'package:flutter/material.dart';
import 'package:todoey/screens/tasks_screen.dart';

class AddTasksScreen extends StatelessWidget {
  final void Function()? onSubmit;
  AddTasksScreen({required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    var taskText;

    return Container(
      color: Color(0xff757575),
      child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 20,
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Add Task',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      )),
                  TextField(
                    autofocus: true,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(width: 4, color: Colors.lightBlueAccent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(width: 4, color: Colors.lightBlueAccent),
                      ),
                      border: UnderlineInputBorder(
                        borderSide:
                            BorderSide(width: 4, color: Colors.lightBlueAccent),
                      ),
                    ),
                    onChanged: (value) {
                      TasksScreen.taskText = value;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 25,
                    ),
                    child: FlatButton(
                        onPressed: onSubmit,
                        child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 60, vertical: 20),
                            child: Text(
                              'Add',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            )),
                        color: Colors.lightBlueAccent),
                  ),
                ]),
          )),
    );
  }
}
