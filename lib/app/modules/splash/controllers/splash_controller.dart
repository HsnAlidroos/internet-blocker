import 'package:blocker/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    Future.delayed(Duration(seconds: 3), () => Get.offNamed(Routes.HOME));
    super.onReady();
  }
}
