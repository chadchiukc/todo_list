import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/utils/text_theme.dart';
import 'routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.blue,
        textTheme: CustomTextTheme().customTextTheme,
      ),
      initialRoute: "/",
      getPages: routes(),
    );
  }
}
