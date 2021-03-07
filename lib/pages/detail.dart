import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail List'),
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
