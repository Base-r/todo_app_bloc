import 'package:flutter/material.dart';
import 'package:todo_app_bloc/blocs/bloc_export.dart';

import 'package:todo_app_bloc/models/task.dart';

class AddTaskWidget extends StatefulWidget {
  const AddTaskWidget({
    super.key,
  });

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    final textTitleKey = GlobalKey<FormState>();
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              'Add Task',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Form(
            key: textTitleKey,
            child: TextFormField(
              controller: titleController,
              autofocus: true,
              decoration: const InputDecoration(
                  label: Text('Title'), border: OutlineInputBorder()),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    var task = Task(
                      title: titleController.text,
                      id: '',
                    );
                    context.read<TaskBloc>().add(AddTask(task: task));

                    Navigator.pop(context);
                  },
                  child: const Text('Add')),
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'))
            ],
          )
        ],
      ),
    );
  }
}
