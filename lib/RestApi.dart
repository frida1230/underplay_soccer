import 'dart:convert';
import "package:http/http.dart" as http;
import 'model/User.dart';

class RestApi {
  RestApi._();
  static final RestApi _instance = RestApi._();
  factory RestApi() => _instance;

  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Access-Control-Request-Headers': '*',
  };

  Future<void> SignUp(String email, String name, String phone, String avatar, String pwd) async {
    Map param = {
      "email": email,
      "avatar": avatar,
      "phone": phone,
      "name": name,
      "pwd" : pwd
    };

    final String encodedData = convertJson(param);

    final response = await http.post(
      Uri.parse(
          "https://q776bjvfe5.execute-api.ap-northeast-2.amazonaws.com/underplay/signup"),
      body: encodedData,
      headers: headers,
    );

    print(response.body);
  }

  Future<UserData> getUser(String email, String pwd) async {
    Map param = {
      "email": email,
      "pwd": pwd
    };

    final String encodedData = convertJson(param);

    final response = await http.post(
      Uri.parse(
          "https://q776bjvfe5.execute-api.ap-northeast-2.amazonaws.com/underplay/getuser"),
      body: encodedData,
      headers: headers,
    );

    var parsed = jsonDecode(response.body);

    UserData ud = UserData(
        email: parsed[0]['email'] as String,
        avatar: parsed[0]['avatar'] as String,
        phone: parsed[0]['phone'] as String,
        name: parsed[0]['name'] as String,
        pwd: parsed[0]['pwd'] as String
    );

    return ud;
  }

  dynamic convertJson(dynamic param) {
    const JsonEncoder encoder = JsonEncoder();
    final dynamic object = encoder.convert(param);
    return object;
  }
}