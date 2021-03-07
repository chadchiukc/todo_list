import 'package:get/route_manager.dart';
import 'package:todo_list/pages/detail.dart';
import 'package:todo_list/pages/home.dart';

routes() => [
      GetPage(name: '/', page: () => Home()),
      GetPage(name: '/detail/', page: () => Detail())
    ];
