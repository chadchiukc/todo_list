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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
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
                    () {
                      int taskLen = taskCtrl.tasklist
                          .where((task) => task.isDone == false)
                          .length;
                      return Text(taskLen > 1
                          ? '$taskLen tasks to do'
                          : '$taskLen task to do');
                    },
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
              child: Obx(
                () => ListView.builder(
                  itemCount: taskCtrl.tasklist.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (_) {
                        var removed = taskCtrl.tasklist[index];
                        taskCtrl.tasklist.removeAt(index);
                        Get.snackbar(
                          'Task removed',
                          'The task "${removed.name}" was removed.',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Theme.of(context).accentColor,
                          mainButton: TextButton(
                              onPressed: () {
                                taskCtrl.tasklist.insert(index, removed);
                              },
                              child: Text('Undo')),
                        );
                      },
                      child: Card(
                        color: Colors.blue[50],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: ListTile(
                          leading: Checkbox(
                            value: taskCtrl.tasklist[index].isDone,
                            onChanged: (bool newBool) {
                              var changed = taskCtrl.tasklist[index];
                              changed.isDone = newBool;
                              taskCtrl.tasklist[index] = changed;
                            },
                          ),
                          title: GestureDetector(
                            onTap: () {
                              Get.toNamed('/detail/$index');
                            },
                            child: Text(
                              taskCtrl.tasklist[index].name,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
