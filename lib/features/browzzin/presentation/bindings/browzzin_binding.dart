import 'package:get/get.dart';
import '../controllers/browzzin_controller.dart';

class BrowzzinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BrowzzinController>(() => BrowzzinController());
  }
}
