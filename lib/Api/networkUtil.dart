import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkUtil {
  static NetworkUtil instance = new NetworkUtil.internal();

  NetworkUtil.internal();

  factory NetworkUtil() => instance;

  final JsonDecoder decoder = new JsonDecoder();
  

  Future <dynamic> get ( String url) {
    return http.get(url).then((http.Response response){
      final String res  = response.body;
      final int statusCode = response.statusCode;
      if (statusCode == 200) {
        return decoder.convert(res);
      } else {
        throw new Exception("Error get Data");
      }
    });
  }

}