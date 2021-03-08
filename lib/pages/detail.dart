import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:todo_list/controllers/todo_controller.dart';
import 'package:get/get.dart';

class Detail extends StatelessWidget {
  final int taskid = int.tryParse(Get.parameters['id']);
  final TodotaskController taskCtrl = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(taskCtrl.tasklist[taskid].name),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.toNamed('/');
          },
        ),
      ),
    );
  }
}
