import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:intl/intl.dart';
import 'model/User.dart';

class RestApi {
  RestApi._();
  static final RestApi _instance = RestApi._();
  factory RestApi() => _instance;

  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Access-Control-Request-Headers': '*',
    //'api-key':
    //'0xs3Of0dzGEmXKZLvQ6gGnSbMntL4clyMCZSeEXS8AACRhi0ipzbshthP2QcNtfG'
  };

  Map<String, String> cookies = {};

  Future<dynamic> goodiezGet(String url) async {
    print('get() url: $url');
    http.Response response =
    await http.get(Uri.encodeFull(url) as Uri, headers: headers);
    final int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode > 400) {}
    return json.decode(utf8.decode(response.bodyBytes));
  }

  Future<void> SignUp(String email, String name, String phone, String avatar) async {
    Map param = {
      "email": email,
      "avatar": avatar,
      "name": name,
      "phone": phone,
      "created": DateFormat('yyyy-MM-dd').format(DateTime.now())
    };
    final String encodedData = convertJson(param);
    final response = await http.post(
      Uri.parse(
          "https://q776bjvfe5.execute-api.ap-northeast-2.amazonaws.com/underplay/signup"),
      body: encodedData,
      headers: headers,
    );
  }

  Future<UserData> getUser(String email) async {
    Map param = {
      "email": email,
    };
    final String encodedData = convertJson(param);

    final response = await http.post(
      Uri.parse(
          "https://q776bjvfe5.execute-api.ap-northeast-2.amazonaws.com/underplay/getUser"),
      body: encodedData,
      headers: headers,
    );

    var parsed = jsonDecode(response.body);

    UserData ud = UserData(
        email: parsed['Item']['email']['S'],
        avatar: parsed['Item']['avatar']['S'],
        phone: parsed['Item']['phone']['S'],
        name: parsed['Item']['name']['S'],
        created: parsed['Item']['created']['S']);

    return ud;
  }

  dynamic convertJson(dynamic param) {
    const JsonEncoder encoder = JsonEncoder();
    final dynamic object = encoder.convert(param);
    return object;
  }
}