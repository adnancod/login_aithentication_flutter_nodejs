


import '../data/network/network_api_services.dart';
import '../res/api_url/api_url.dart';

class LoginRepository{

  final _apiServices= NetworkApiServices();

  Future<dynamic> LoginApi(var data)async{

    //Change the Url to your desired
    dynamic response= await _apiServices.getPostApiResponse(ApiUrl.loginApi, data);
    return response;
  }
}


//This is for Post Api