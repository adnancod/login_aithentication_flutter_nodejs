import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:login_authentication/res/routes/routes_name.dart';
import 'package:login_authentication/view_model/controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formkey= GlobalKey<FormState>();
  final loginController= Get.put(LoginController());

  @override
  void dispose() {
    loginController.emailController.dispose();
    loginController.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width= MediaQuery.sizeOf(context).width;
    final height= MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Login'),
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
                    controller: loginController.emailController,
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
                    controller: loginController.passwordController,
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
                    loginController.LoginApi();
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
                    child: Center(child: loginController.isLoading.value? CircularProgressIndicator(): Text('Login')),
                  );
                })
              ),
              SizedBox(height: height*0.005,),
              TextButton(
                  onPressed: (){
                    Get.toNamed(RoutesName.forgotPassword);
                  },
                  child: Text('Forgot Password')),
              SizedBox(height: height*0.03,),
              InkWell(
                onTap: (){
                  Get.toNamed(RoutesName.signupScreen);
                },
                child: Container(
                  height: height > 600 ? 50 : height*0.08,
                  width: width > 600 ? 120 : width*0.6,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Center(child: Text('No account yet, Signup')),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
