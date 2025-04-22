import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:login_authentication/view_model/controller/login_controller.dart';
import 'package:login_authentication/view_model/controller/signup_controller.dart';

import '../res/routes/routes_name.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final _formkey= GlobalKey<FormState>();
  final loginController= Get.put(LoginController());
  final signupController= Get.put(SignupController());
  @override
  void dispose() {
    signupController.emailController.dispose();
    signupController.passwordController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    final width= MediaQuery.sizeOf(context).width;
    final height= MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Signup'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: width> 600 ? 400 : width,
                  child: TextFormField(
                    controller: signupController.emailController,
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
                ),
              ),
              SizedBox(height: height*0.03,),
              SizedBox(
                  width: width> 600 ? 400 : width,
                  child: Obx((){
                    return TextFormField(
                      controller: signupController.passwordController,
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
              SizedBox(height: height*0.05,),
              InkWell(
                onTap: (){
                  if(_formkey.currentState!.validate()){
                    signupController.SignupApi();
                    // Get.snackbar("Signup", "Signup Sucessful");
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
                    child: Center(child: signupController.isLoading.value? CircularProgressIndicator(): Text('Signup')),
                  );
                })
              ),
              TextButton(
                  onPressed: (){
                    Get.toNamed(RoutesName.loginScreen);
                  },
                  child: Text('Already have an account, Login'))
            ],
          ),
        ),
      ),
    );
  }
}
