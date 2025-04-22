
import '../data/network/network_api_services.dart';
import '../res/api_url/api_url.dart';

class SignupRepository{

  final _apiServices= NetworkApiServices();

  Future<dynamic> SignupApi(var data)async{

    //Change the Url to your desired
    dynamic response= await _apiServices.getPostApiResponse(ApiUrl.signupApi, data);
    return response;
  }
}


//This is for Post Api