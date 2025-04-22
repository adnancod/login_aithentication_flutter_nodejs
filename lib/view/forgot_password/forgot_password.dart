import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:login_authentication/res/routes/routes_name.dart';
import 'package:login_authentication/view_model/controller/forgot_password_controller.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final forgotPasswordController= Get.put(ForgotPasswordController());
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
              Text('Forgot Password?',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: height*0.02,),
              Text('No worries, we will send you reset instructions'),
              SizedBox(height: height*0.1,),
              TextFormField(
              controller: forgotPasswordController.emailController,
                keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                  )
              ),
              validator: (value){
                if(value!.isEmpty){
                  return 'Enter Email';
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                  return 'Enter a valid email';
                }
                return null;
              },
              ),
              SizedBox(height: height*0.05,),
              Obx((){
                return InkWell(
                    onTap: (){
                      if(_formkey.currentState!.validate()){
                        // Get.toNamed(RoutesName.resetPassword);
                        forgotPasswordController.ForgotPasswordApi();
                      }
                    },
                    child: Container(
                      height: height > 600 ? 50 : height*0.08,
                      width: width > 600 ? 120 : width*0.6,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Center(child: forgotPasswordController.isLoading.value? CircularProgressIndicator(): Text('Reset Password')),
                    )
                );
              }),
                SizedBox(height: height*0.01,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: TextButton(
                      onPressed: (){
                        Get.back();
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
        ),
      ),
    );
  }
}
