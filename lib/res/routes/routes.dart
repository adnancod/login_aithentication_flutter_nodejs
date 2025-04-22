import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:login_authentication/res/routes/routes_name.dart';
import 'package:login_authentication/view/forgot_password/forgot_password.dart';
import 'package:login_authentication/view/forgot_password/newPassword.dart';
import 'package:login_authentication/view/forgot_password/reset_password.dart';
import 'package:login_authentication/view/home/home_screen.dart';
import 'package:login_authentication/view/login_screen.dart';
import 'package:login_authentication/view/signup_screen.dart';

class AppRoutes {
  static appRoutes() {
    return [
      GetPage(
          name: RoutesName.loginScreen,
          page: () => LoginScreen(),
          transition: Transition.fade,
          transitionDuration: Duration(milliseconds: 250)
      ),
      GetPage(
          name: RoutesName.signupScreen,
          page: () => SignupScreen(),
          transition: Transition.fade,
          transitionDuration: Duration(milliseconds: 250)
      ),
      GetPage(
          name: RoutesName.homeScreen,
          page: () => HomeScreen(),
          transition: Transition.fade,
          transitionDuration: Duration(milliseconds: 250)
      ),
      GetPage(
          name: RoutesName.forgotPassword,
          page: () => ForgotPassword(),
          transition: Transition.fade,
          transitionDuration: Duration(milliseconds: 250)
      ),
      GetPage(
          name: RoutesName.resetPassword,
          page: () => ResetPassword(),
          transition: Transition.fade,
          transitionDuration: Duration(milliseconds: 250)
      ),
      GetPage(
          name: RoutesName.newPassword,
          page: () => NewPassword(),
          transition: Transition.fade,
          transitionDuration: Duration(milliseconds: 250)
      ),

    ];


  }
}
