import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api
{
  Future<dynamic> getRequest({required String url,@required String? token})async
  {
    Map<String,String> headers={};
    if(token != null)
    {
      headers.addAll({'Authorization':'Bearer $token'});
    }
    http.Response response = await http.get(Uri.parse(url),headers: headers);
    if(response.statusCode == 200)
    {
      return jsonDecode(response.body);
    }else{
      throw Exception('there is error with ${response.statusCode}');
    }
  }

  Future<dynamic> postRequest({
  required String url,
    @required dynamic body,
    @required String? token,
})async
  {
    Map<String,String> headers={};
    if(token != null)
    {
      headers.addAll({'Authorization':'Bearer $token'});
    }
    http.Response response = await http.post(Uri.parse(url), body:body, headers:headers,);

    if(response.statusCode == 200)
    {
      Map<String,dynamic> data = jsonDecode(response.body);
      return data;
    }else
    {
      throw Exception('there is a problem in ${response.statusCode} and body: ${response.body}');
    }

  }


  Future<dynamic> putRequest({
    required String url,
    @required dynamic body,
    @required String? token,
  })async
  {
    Map<String,String> headers={};
    headers.addAll({
      'Content-Type':'application/x-www-form-urlencoded',
    });
    if(token != null)
    {
      headers.addAll({'Authorization':'Bearer $token'});
    }
    debugPrint('url = $url body = $body token = $token');
    http.Response response = await http.post(Uri.parse(url), body:body, headers:headers,);

    if(response.statusCode == 200)
    {
      Map<String,dynamic> data = jsonDecode(response.body);
      debugPrint('data = = $data');
      return data;
    }else
    {
      throw Exception('there is a problem in ${response.statusCode} and body: ${response.body}');
    }

  }


}