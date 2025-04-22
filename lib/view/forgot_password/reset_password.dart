import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:login_authentication/res/routes/routes_name.dart';
import 'package:login_authentication/view_model/controller/reset_password_controller.dart';
import 'package:pinput/pinput.dart';

import '../../utils/utils.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {

  final resetController= Get.put(ResetPasswordController());

  final _formkey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.sizeOf(context).height;
    final width= MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Password Reset',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),),
                SizedBox(height: height*0.02,),
                Text('Enter the code sent on your email'),
                SizedBox(height: height*0.1,),
                Pinput(
                  controller: resetController.codeController,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  length: 5,
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  defaultPinTheme: PinTheme(
                    width: 56,
                    height: 56,
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    width: 56,
                    height: 56,
                    textStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the reset code';
                    }
                    return null;
                  },
                  onChanged: (pin) {
                    resetController.codeController.text = pin; // Keep in sync
                  },
                  onCompleted: (pin){
                    resetController.codeController.text= pin;
                  },
                ),
                SizedBox(height: height*0.1,),
                ElevatedButton(
                  onPressed: () {
                    resetController.VerifyPasswordApi();
                  },
                  child: Text("Verify"),
                ),
                SizedBox(height: height*0.01,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: TextButton(
                      onPressed: (){
                        Get.toNamed(RoutesName.loginScreen);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_back),
                          SizedBox(width: width*0.02,),
                          Text('Back to Login')
                        ],
                      )),
                )
              ],
            ),
          )),
    );
  }
}
