import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:login_authentication/repository/new_password_repository.dart';

import '../../data/app_exceptions.dart';
import '../../res/routes/routes_name.dart';
import '../../utils/utils.dart';

class NewPasswordController extends GetxController{

  final _api= NewPasswordRepository();

  final passwordController= TextEditingController();
  final confirmPasswordController= TextEditingController();

  var isPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  RxBool isLoading = false.obs;

  void toggleLoading() {
    isLoading.value = !isLoading.value;
  }
  String email ='';
  String code='';

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments is List<String>) {
      List<String> args = Get.arguments;
      email = args[0]; // email
      code = args[1];  // code
    }
  }

  void NewPasswordApi() {
    toggleLoading();
    Map data = {
      "email": email,
      "code": code,
      "newPassword": confirmPasswordController.value.text,
    };

    _api.NewPasswordApi(data).then((value) {
      toggleLoading();

      if (value['error'] == 'Invalid reset code' || value['error'] == 'Reset code Expires') {
        Utils.toastMessage(value['error']);
      } else {
          Get.toNamed(RoutesName.loginScreen);
          confirmPasswordController.clear();
          passwordController.clear();
          Utils.toastMessage('Password Changed Successfully');
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
        Utils.toastMessage("Something went wrong");
      }
    });
  }

}
