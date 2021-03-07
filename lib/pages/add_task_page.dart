import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controllers/todo_controller.dart';
import 'package:todo_list/models/task.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TodotaskController taskCtrl = Get.find();
    String newTask;

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2,
            ),
            TextField(
              autofocus: true,
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newTask = newText;
              },
            ),
            ElevatedButton(
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                taskCtrl.tasklist.add(Task(name: newTask));
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
