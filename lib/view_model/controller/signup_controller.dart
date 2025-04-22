
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:login_authentication/repository/signup_repository.dart';
import 'package:login_authentication/res/routes/routes_name.dart';

import '../../repository/login_repository.dart';
import '../../utils/utils.dart';

class SignupController extends GetxController{

  final _api= SignupRepository();

  final emailController= TextEditingController();
  final passwordController= TextEditingController();

  RxBool isLoading = false.obs;
  void toggleLoading() {
    isLoading.value = !isLoading.value;
  }

  void SignupApi(){
    toggleLoading();
    Map data={
      "email": emailController.value.text,
      "password": passwordController.value.text
    };


    _api.SignupApi(data).then((value){
      toggleLoading();

      if(value['error']=='user Not found'){
        Utils.toastMessage(value['error']);
      }
      else{
        Get.toNamed(RoutesName.loginScreen);
        emailController.clear();
        passwordController.clear();
        Utils.toastMessage('Signup Successful, Login to continue...');
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