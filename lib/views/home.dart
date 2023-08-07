import 'package:flutter/material.dart';
import 'package:flutter_mvc/routes/routes_path.dart';
import 'package:flutter_mvc/views/todo_list_view.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});

  // Rx{Type}
  // final name = RxString('');
  // final isLogged = RxBool(false);
  // final count = RxInt(0);
  // final balance = RxDouble(0.0);
  // final items = RxList<String>([]);
  // final myMap = RxMap<String, int>({});

  // Rx<Type>
  // final name = Rx<String>('');
  // final isLogged = Rx<bool>(false);
  // final count = Rx<int>(0);
  // final balance = Rx<double>(0.0);
  // final items = Rx<List<String>>([]);
  // final myMap = Rx<Map<String, int>>({});
  // final user = Rx<User>(User());

  // .obs
  final name = ''.obs;
  final isLogged = false.obs;
  final count = 0.obs;
  final balance = 0.0.obs;
  final items = <String>[].obs;
  final myMap = <String, int>{}.obs;
  final user = User(name: "Dart", age: 22).obs;

  void increment() => count.value++;

  void toUpper() {
    user.update((user) {
      user!.name = user.name.toUpperCase();
      user.age = user.age + 1;
    });
    user(User(name: 'Flutter'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: container(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => toUpper(),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () => increment(),
      // ),
    );
  }

  container() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Obx(() => Text(
                '${count.value}',
                style: TextStyle(fontSize: 28),
              )),
          Obx(() => Text(
                '${user.value.name} ${user().age}',
                style: TextStyle(fontSize: 28),
              )),
          ElevatedButton(
            child: Text("Go To TodoListView"),
            onPressed: () {
              Get.to(() => TodoListView(), arguments: 'Hello from Get.to()');
            },
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
            child: Text("Name Route: /todolistview"),
            onPressed: () {
              Get.toNamed('${RoutesPath.todoListView}?id=1&name=Dart');
            },
          ),
        ],
      ),
    );
  }
}

class User {
  String name;
  int age;

  User({this.name = '', this.age = 0});
}
