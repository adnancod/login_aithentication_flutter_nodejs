
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:login_authentication/repository/reset_password_repository.dart';

import '../../res/routes/routes_name.dart';
import '../../utils/utils.dart';

class ResetPasswordController extends GetxController{

  final _api= ResetPasswordRepository();

  final codeController= TextEditingController();

  String email ='';

  @override
  void onInit() {
    super.onInit();
    // Get the email passed from ForgotPassword screen
    email = Get.arguments ?? '';
  }

  RxBool isLoading = false.obs;

  void toggleLoading() {
    isLoading.value = !isLoading.value;
  }

  void VerifyPasswordApi() {
    toggleLoading();
    print(codeController.value.text);
    Map data = {
      "email": email,
      "code": codeController.value.text,
    };
    print(data);

    _api.ResetPasswordApi(data).then((value){
      toggleLoading();

      if(value['message']=='Invalid reset code'){
        Utils.toastMessage('Invalid reset code');
      }
      else{
        Get.toNamed(RoutesName.newPassword, arguments: [email, codeController.value.text]);
        codeController.clear();
        Utils.toastMessage('Code Verified Successfully');
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