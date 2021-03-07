import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controllers/todo_controller.dart';
import 'package:todo_list/pages/add_task_page.dart';
import 'package:todo_list/pages/detail.dart';

class Home extends StatelessWidget {
  final TodotaskController taskCtrl = Get.put(TodotaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen(),
          );
        },
      ),
      body: Column(
        children: [
          SafeArea(
            child: Container(
              // padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Icon(
                      Icons.list,
                      size: 50,
                    ),
                  ),
                  Text('Chad\'s To Do List',
                      style: Theme.of(context).textTheme.headline1),
                  Obx(
                    () => Text('${taskCtrl.tasklist.length} tasks to do'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
