import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _tasksKey = 'task_list';

class Data extends ChangeNotifier {
  List<Task> tasks = [];

  void changeList(List<Task> newList) {
    tasks = newList;
    notifyListeners();
  }

  int get taskCount {
    return tasks.length;
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
    save();
  }

  void addTask(String name, {bool isDone = false, bool saveAfterAdd = true}) {
    tasks.add(Task(name: name, isDone: isDone));
    notifyListeners();
    if (saveAfterAdd) {
      save();
    }
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  List<String> get taskNames {
    return tasks.map((e) => e.name).toList();
  }

  save({task}) async {
    final prefs = await SharedPreferences.getInstance();

    if (task != null) {
      prefs.setBool(task.name, task.isDone);
      return;
    }
    final List<String> value = this.taskNames;
    prefs.setStringList(_tasksKey, value);

    tasks.forEach((task) {
      print('Save - ${task.name}: ${task.isDone}');
      prefs.setBool(task.name, task.isDone);
    });
  }

  load() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> tasks = prefs.getStringList(_tasksKey) ?? [];

    tasks.forEach((taskName) {
      addTask(
        taskName,
        isDone: prefs.getBool(taskName) ?? false,
        saveAfterAdd: true,
      );
    });
  }
}
