import 'package:flutter/material.dart';
import 'package:todo_app_bloc/blocs/bloc_export.dart';
import 'package:todo_app_bloc/models/task.dart';

// ignore: must_be_immutable
class TaskList extends StatefulWidget {
  TaskList({
    super.key,
    required this.tasksList,
  });

  List<Task> tasksList;

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.tasksList.length,
        itemBuilder: (context, index) {
          var task = widget.tasksList[index];
          void updateTask() {
            context.read<TaskBloc>().add(UpdateTask(task: task));
          }

          void deleteTask() {
            context.read<TaskBloc>().add(DeleteTask(task: task));
          }
          return ListTile(
            title: Text(task.title),
            trailing: Checkbox(
              value: task.isDone,
              onChanged: (value) => updateTask(),
            ),
            onLongPress: () => deleteTask(),
          );
        },
      ),
    );
  }
}
