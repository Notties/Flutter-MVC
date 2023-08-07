import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  //with static method: Controller.to.increment();
  //with no static method: Get.find<Controller>().increment();
  // static Controller get to => Get.find();

  final counter = 0.obs;
  int number = 0;
  final Rx<String> name = 'Dart'.obs;

  @override
  void onInit() {
    super.onInit();
    debugPrint("Controller init");

    //Called every time count changes.
    // ever(counter, (value) => debugPrint("$value has been changed"));
    // everAll([counter], (value) => debugPrint("$value has been changed"));

    // Called only first time the variable $value is changed
    // once(counter, (value) => debugPrint("$value has been changed"));

    // debounce(counter, (value) => debugPrint("$value has been changed"),
    // time: const Duration(milliseconds: 1000));

    // ignore all changes within 1000 milliseconds
    interval(counter, (value) => debugPrint("$value interval"),
    time: const Duration(milliseconds: 1000));
  }

  @override
  void onReady() {
    super.onReady();
    debugPrint("Controller ready");
  }

  @override
  void onClose() {
    super.onClose();
    debugPrint("Controller close");
  }

  void increment() {
    counter.value++;
    number++;
    // counter++;
    update(['count1'], number <= 10);
  }

  void addNumber() {
    number++;
    update();
  }
}
