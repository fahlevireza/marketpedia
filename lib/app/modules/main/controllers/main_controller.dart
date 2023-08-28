import 'package:get/get.dart';

class MainController extends GetxController {
  final RxInt currentIndex = 0.obs;

  void updateIndex(int index) {
    currentIndex.value = index;
  }
}
