import 'package:get/get.dart';
import 'package:learn_getx_g9/home/home_controller.dart';

class HomeBinding implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }

}