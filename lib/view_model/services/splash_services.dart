import 'dart:async';
import 'package:get/get.dart';

import '../../res/routes/routes_name.dart';
import '../controller/user_view_model.dart';

class SplashServices {
  UserViewModel userViewModel = UserViewModel();

  void isLogin() {
    userViewModel.getUser().then((value) {
      print(value.token);
      if (value.token.toString() == 'null' || value.token!.isEmpty) {
        Timer(const Duration(seconds: 3), () {
          Get.toNamed(RoutesName.loginScreen);
        });
      } else {
        Timer(const Duration(seconds: 3), () {
          Get.toNamed(RoutesName.homeScreen);
        });
      }
    }).catchError((error) {
      print("Error fetching user: $error");
      Get.toNamed(RoutesName.loginScreen);
    });
  }
}
