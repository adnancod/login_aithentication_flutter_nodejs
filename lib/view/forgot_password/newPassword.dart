import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:login_authentication/view_model/controller/new_password_controller.dart';

import '../../utils/utils.dart';
import '../../view_model/controller/login_controller.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {

  final newPasswordController= Get.put(NewPasswordController());
  final loginController= Get.put(LoginController());

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
                Text('Set New Password',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),),
                SizedBox(height: height*0.06,),

                SizedBox(
                    width: width> 600 ? 400 : width,
                    child: Obx((){
                      return TextFormField(
                        controller: newPasswordController.passwordController,
                        obscureText: loginController.isPasswordHidden.value,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: (){
                                loginController.togglePasswordVisibility();
                              },
                              icon: Icon(loginController.isPasswordHidden.value
                                  ? Icons.visibility_off
                                  : Icons.visibility),),
                            labelText: 'Password',
                            hintText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                            )
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Enter Password';
                          }
                          return null;
                        },
                      );
                    })
                ),
                SizedBox(height: height*0.03,),
                SizedBox(
                    width: width> 600 ? 400 : width,
                    child: Obx((){
                      return TextFormField(
                        controller: newPasswordController.confirmPasswordController,
                        obscureText: newPasswordController.isPasswordHidden.value,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: (){
                                newPasswordController.togglePasswordVisibility();
                              },
                              icon: Icon(loginController.isPasswordHidden.value
                                  ? Icons.visibility_off
                                  : Icons.visibility),),
                            labelText: 'Confirm Password',
                            hintText: 'Confirm Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                            )
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Enter Password';
                          }
                          return null;
                        },
                      );
                    })
                ),
                SizedBox(height: height*0.05,),
                InkWell(
                    onTap: (){
                      if(_formkey.currentState!.validate()){
                        if(newPasswordController.passwordController.text != newPasswordController.confirmPasswordController.text){
                            Utils.toastMessage('Password do not match');
                        }
                        else{
                          newPasswordController.NewPasswordApi();
                        }
                      }
                    },
                    child: Obx((){
                      return Container(
                        height: height > 600 ? 50 : height*0.08,
                        width: width > 600 ? 120 : width*0.6,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Center(child: newPasswordController.isLoading.value? CircularProgressIndicator(): Text('Change Password')),
                      );
                    })
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: TextButton(
                      onPressed: (){
                        // Get.toNamed(RoutesName.loginScreen);
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
