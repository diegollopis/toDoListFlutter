import 'package:flutter/cupertino.dart';
import '../components/task.dart';

class TaskInherited extends InheritedWidget {

  List<Task> taskList = [
    Task('Learn Flutter', 'assets/images/dash.png', 3),
    Task('How to ride a bike', 'assets/images/bike.webp', 2),
    Task('Read a book about algorithms', 'assets/images/livro.jpg', 4),
    Task('Take time for myself', 'assets/images/meditar.jpeg', 4),
    Task('Play video-game and finish TopGear', 'assets/images/jogar.jpg', 5),
  ];

  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  void addTask(String name, String image, int level) {
    taskList.add(Task(name, image, level));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No Taskinherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited old) {
    return old.taskList.length != taskList.length;
  }
}
