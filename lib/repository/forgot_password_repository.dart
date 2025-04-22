
import '../data/network/network_api_services.dart';
import '../res/api_url/api_url.dart';

class ForgotPasswordRepository{

  final _apiServices= NetworkApiServices();

  Future<dynamic> ForgotPasswordApi(var data)async{

    //Change the Url to your desired
    dynamic response= await _apiServices.getPostApiResponse(ApiUrl.forgotPasswordApi, data);
    return response;
  }
}