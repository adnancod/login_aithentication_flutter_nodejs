


import '../data/network/network_api_services.dart';
import '../res/api_url/api_url.dart';

class NewPasswordRepository{

  final _apiServices= NetworkApiServices();

  Future<dynamic> NewPasswordApi(var data)async{

    //Change the Url to your desired
    dynamic response= await _apiServices.getPostApiResponse(ApiUrl.newPasswordApi, data);
    return response;
  }
}


//This is for Post Api