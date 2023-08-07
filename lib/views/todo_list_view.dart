import 'package:flutter/material.dart';
import 'package:flutter_mvc/controllers/simple_state_controller.dart';
import 'package:flutter_mvc/routes/routes_path.dart';
import 'package:get/get.dart';

class TodoListView extends StatelessWidget {
  TodoListView({super.key});

  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TodoListView"),
        centerTitle: true,
      ),
      body: container(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Get.find<Controller>().increment(),
      ),
    );
  }

  Center container() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GetBuilder<Controller>(
            id: "count1",
            init: controller,
            builder: (controller) => Text(
              "${controller.number}",
              style: TextStyle(fontSize: 28),
            ),
          ),
          GetX<Controller>(
            builder: (controller) => Text(
              "${controller.counter.value}",
              style: TextStyle(fontSize: 28),
            ),
          ),
          GetX<Controller>(
            init: controller,
            builder: (controller) => Text(
              controller.name.value,
              style: TextStyle(fontSize: 28),
            ),
          ),
          Obx(
            () => Text(
              "${controller.counter.value}",
              style: TextStyle(fontSize: 28),
            ),
          ),
          Text('arguments: ${Get.arguments}'),
          Text(
              'parameters: id:${Get.parameters["id"]} name: ${Get.parameters["name"]}'),
          ElevatedButton(
            child: Text("Back To Home"),
            onPressed: () {
              Get.back();
            },
          ),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
            child: Text("Name Route: /"),
            onPressed: () {
              Get.toNamed(RoutesPath.home);
            },
          ),
          ElevatedButton(
            child: Text("Get offAll"),
            onPressed: () {
              Get.offAllNamed(RoutesPath.home);
            },
          )
        ],
      ),
    );
  }
}
