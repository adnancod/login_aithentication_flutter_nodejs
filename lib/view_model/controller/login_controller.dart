import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:login_authentication/res/routes/routes_name.dart';
import 'package:login_authentication/view_model/controller/user_view_model.dart';

import '../../data/app_exceptions.dart';
import '../../models/user_login_model.dart';
import '../../repository/login_repository.dart';
import '../../utils/utils.dart';

class LoginController extends GetxController {

  final _api = LoginRepository();
  UserViewModel userViewModel = UserViewModel();

  var isPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool isLoading = false.obs;

  void toggleLoading() {
    isLoading.value = !isLoading.value;
  }

  void LoginApi() {
    toggleLoading();
    Map data = {
      "email": emailController.value.text,
      "password": passwordController.value.text
    };

    _api.LoginApi(data).then((value) {
      toggleLoading();

      if (value['error'] == 'Invalid Username or Password') {
        Utils.toastMessage(value['error']);
      } else {
        userViewModel.saveUser(UserLoginModel.fromJson(value)).then((value) {
          Get.toNamed(RoutesName.homeScreen);
          emailController.clear();
          passwordController.clear();
          Utils.toastMessage('Login Successfully');
        });
      }

    }).onError((error, stackTrace) {
      toggleLoading();

      // Log the error details for debugging
      print("Error: $error");
      print("StackTrace: $stackTrace");

      // Handle specific server errors
      if (error is FetchDataException) {
        Utils.toastMessage("Error during communication with the server. Please try again.");
      } else if (error is BadRequestException) {
        Utils.toastMessage("Invalid request. Please check your input.");
      } else {
        Utils.toastMessage("Email or Password incorrect");
      }
    });
  }
}
