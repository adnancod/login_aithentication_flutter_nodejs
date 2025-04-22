
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUrl{


  static final String baseApi= dotenv.env['BASE_URL'] ?? '';

  static final String loginApi= '$baseApi/login';

  static final String signupApi= '$baseApi/signup';

  static final String forgotPasswordApi= '$baseApi/forgot-password';

  static final String resetVerifyPasswordApi= '$baseApi/verify-reset-code';

  static final String newPasswordApi= '$baseApi/reset-password';

}
