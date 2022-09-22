import 'dart:convert';

import 'package:http/http.dart'as http;

class NetworkHelper{
  final String url;
  NetworkHelper(this.url);

  Future network() async{
    http.Response response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    return jsonResponse;
    }else{
      print(response.statusCode);
    }
  }
}