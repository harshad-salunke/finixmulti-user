import 'dart:convert';

import 'package:http/http.dart' as http;
class RequestAsistance{

  static Future<dynamic> getRequest(String url) async{
    http.Response response =await http.get(Uri.parse(url));

    try{
      if(response.statusCode==200){
        String data=response.body;
        var jsondata=jsonDecode(data);
        return jsondata;

      }else{
        return "failed";
      }

    }catch(exception){
      return "failed";

    }

  }
}