import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final Dio _dio = Dio();

  Future<dynamic> registerUser(Map<String, dynamic>? data) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:8080/auth/nuevo'),
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      //debugPrint(response.statusCode.toString());
      //debugPrint(response.toString());
        
      Map<String, dynamic> realresponse = {
          "status": jsonDecode(response.body)["status"],
          "message": jsonDecode(response.body)["message"].toString(),
          "mensaje": jsonDecode(response.body)["mensaje"].toString(),
          "body": jsonDecode(response.body),
          "statuscode": response.statusCode,
      };
      debugPrint(realresponse.toString());
      return realresponse;
    } catch (e) {
      Map<String, dynamic> realresponse = {
          "status": -1,
          "statuscode": -1,
          "message": e.toString(),
      };
      return realresponse;
    }
  }

Future<dynamic> login(String nombre, String password) async {
  try {
    final response = await http.post(
      Uri.parse('http://localhost:8080/auth/login'),
      body: jsonEncode({
        'nombreUsuario': nombre,
        'password': password,
      }),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
      },
    );

     
    Map<String, dynamic> realresponse = {
        "status": jsonDecode(response.body)["status"],
        "message": jsonDecode(response.body)["message"].toString(),
        "mensaje": jsonDecode(response.body)["mensaje"].toString(),
        "body": jsonDecode(response.body),
        "statuscode": response.statusCode,
    };
    
    return realresponse;
  } catch (e) {
    Map<String, dynamic> realresponse = {
        "status": -1,
        "statuscode": -1,
        "message": e.toString(),
    };
    return realresponse;
  }
}
  /*
  Future<dynamic> getUserProfileData(String accessToken) async {
    try {
      Response response = await _dio.get(
        'https://api.loginradius.com/identity/v2/auth/account',
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
  */

  Future<dynamic> updateUserProfile({
    required String accessToken,
    required Map<String, dynamic> data,
  }) async {
    try {
      Response response = await _dio.put(
        'https://api.loginradius.com/identity/v2/auth/account',
        data: data,
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> logout(String accessToken) async {
    try {
      Response response = await _dio.get(
        'https://api.loginradius.com/identity/v2/auth/access_token/InValidate',
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}