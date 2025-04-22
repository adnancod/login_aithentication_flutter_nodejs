
import '../data/network/network_api_services.dart';
import '../res/api_url/api_url.dart';

class ResetPasswordRepository{

  final _apiServices= NetworkApiServices();

  Future<dynamic> ResetPasswordApi(var data)async{

    //Change the Url to your desired
    dynamic response= await _apiServices.getPostApiResponse(ApiUrl.resetVerifyPasswordApi, data);
    return response;
  }
}