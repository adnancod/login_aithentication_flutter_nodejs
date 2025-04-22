
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_login_model.dart';

class UserViewModel{

  Future<bool> saveUser(UserLoginModel loginModel)async{

    SharedPreferences sp= await SharedPreferences.getInstance();
    sp.setString('token', loginModel.token.toString());

    return true;
  }

  Future<UserLoginModel> getUser()async{

    SharedPreferences sp= await SharedPreferences.getInstance();
    String? token= sp.getString('token');

    return UserLoginModel(
        token: token
    );
  }

  Future<bool> removeUser(UserLoginModel loginModel)async{

    SharedPreferences sp= await SharedPreferences.getInstance();
    sp.clear();

    return true;
  }
}