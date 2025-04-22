
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../app_exceptions.dart';
import 'base_api_services.dart';

class NetworkApiServices extends BaseApiServices{

  @override
  Future getPostApiResponse(String url, dynamic data) async{
    dynamic responseJson;
    try{

      Response response=await post(
          Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
          },
          body : jsonEncode(data)

      ).timeout(Duration(seconds: 60));
      responseJson=returnResponse(response);

    }on SocketException{
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response){
    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');
    dynamic responseJson = jsonDecode(response.body);
    switch(response.statusCode){
      case 200:
        return responseJson;
      case 400:
      case 401:
      case 404:
      case 500:
      // Return error as JSON so frontend can handle
        return responseJson;
      default:
        throw FetchDataException('Error occured while communicating with server with status code '+response.statusCode.toString());
    }
  }

}