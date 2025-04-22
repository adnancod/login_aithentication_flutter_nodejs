
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:login_authentication/repository/forgot_password_repository.dart';

import '../../res/routes/routes_name.dart';
import '../../utils/utils.dart';

class ForgotPasswordController extends GetxController {

  final _api = ForgotPasswordRepository();

  final emailController = TextEditingController();

  RxBool isLoading = false.obs;

  void toggleLoading() {
    isLoading.value = !isLoading.value;
  }

  void ForgotPasswordApi() {
    toggleLoading();
    Map data = {
      "email": emailController.value.text,
    };

    _api.ForgotPasswordApi(data).then((value){
      toggleLoading();

      if(value['error']=='User not found'){
        Utils.toastMessage('Email not registered');
      }
      else{
        Get.toNamed(RoutesName.resetPassword, arguments: emailController.text);
        emailController.clear();
        Utils.toastMessage('Reset Code sent Successfully');
      }
    }).onError((error, stackTrace){
      toggleLoading();
      Utils.toastMessage(error.toString());
      if (kDebugMode) {
        print(error);
      }
    });
  }


}