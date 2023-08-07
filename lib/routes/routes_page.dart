import 'package:flutter_mvc/routes/routes_path.dart';
import 'package:flutter_mvc/views/home.dart';
import 'package:flutter_mvc/views/todo_list_view.dart';
import 'package:get/get.dart';

class RoutePages {
  RoutePages._();

  static final pages = [
    GetPage(
      name: RoutesPath.home,
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.leftToRight,
      page: () => Home(),
    ),
    GetPage(
      name: RoutesPath.todoListView,
      transitionDuration: const Duration(milliseconds: 250),
      transition: Transition.rightToLeft,
      page: () => TodoListView(),
    ),
  ];
}
