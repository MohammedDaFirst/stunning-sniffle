import 'package:flutter/material.dart';

class TasksTile extends StatelessWidget {
  final bool value;
  final String taskTitle;
  final void Function(bool?)? checkboxCallback;
  final void Function()? longPress;

  TasksTile(
      {this.value = false,
      required this.taskTitle,
      required this.checkboxCallback,
      required this.longPress});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(taskTitle,
            style: TextStyle(
                decoration: value ? TextDecoration.lineThrough : null)),
        GestureDetector(
          onLongPress: longPress,
          child: Checkbox(
            value: value,
            activeColor: Colors.lightBlueAccent,
            onChanged: checkboxCallback,
          ),
        )
      ]),
    );
  }
}



//  (value) {
//               setState(() => this.value = value!);
//             })