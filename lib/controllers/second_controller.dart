import 'package:get/get.dart';

class SecondController extends GetxController {
  RxString name = ''.obs;

  void getName(String name) {
    this.name = name.obs;
    update();
  }
}
