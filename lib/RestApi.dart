import 'dart:convert';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'model/Meeting.dart';
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

  Future<void> SetEvent(String email, String subject, String stime, String etime, bool isallday, String Color) async {
    Map param = {
      "email": email,
      "eventname": subject,
      "stime": stime,
      "etime": etime,
      "isallday" : isallday,
      "bg" : Color
    };

    final String encodedData = convertJson(param);

    final response = await http.post(
      Uri.parse(
          "https://q776bjvfe5.execute-api.ap-northeast-2.amazonaws.com/underplay/setevent"),
      body: encodedData,
    );
  }

  Future<List<Meeting>> getEvents(String email) async {
    Map param = {
      "email": email
    };

    final String encodedData = convertJson(param);

    final response = await http.post(
      Uri.parse(
          "https://q776bjvfe5.execute-api.ap-northeast-2.amazonaws.com/underplay/getevents"),
      body: encodedData,
      headers: headers,
    );
    var parsed = jsonDecode(utf8.decode(response.bodyBytes));
    //var parsed = jsonDecode(response.body); //한글 깨짐 현상 발생

    final List<Meeting> loadedevents = [];

    parsed.forEach((eventData) {
      loadedevents.add(Meeting(
        eventName: eventData['eventname'],
        from: DateTime.parse(eventData['stime']),
        to: DateTime.parse(eventData['etime']),
        background: HexColor(eventData['bg']),
        isAllDay: eventData['isallday'] == 0 ? false : true,
      ));
    });

    return loadedevents;
  }

  dynamic convertJson(dynamic param) {
    const JsonEncoder encoder = JsonEncoder();
    final dynamic object = encoder.convert(param);
    return object;
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}