import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uit_hackathon/main_app.dart';
import 'package:uit_hackathon/models/garbage.dart';
import 'package:uit_hackathon/providers/garbage_provider.dart';
import 'package:uit_hackathon/providers/user_provider.dart';
import 'package:uit_hackathon/utils/error_handling.dart';
import 'package:http/http.dart' as http;
import 'package:uit_hackathon/utils/global_variables.dart';

class GarbageServices {
  Future<void> addGarbage({
    required BuildContext context,
    required String name,
    required double price,
    required String description,
    required String type,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('${uri}api/garbage/createGarbage'),
        body: jsonEncode({
          "name": name,
          "price": price,
          "description": description,
          "type": type,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          print("res ne");
          print(res);
          print(json.decode(res.body));
          var response = json.decode(res.body);
          print("data ne");
          print(response.runtimeType);
          Map<String, dynamic> data = response['data'];
          Garbage garbage = Garbage.fromMap(data);
          print(garbage.runtimeType);
          print(garbage.id);
          // const data = response.data;
          // final preps = await SharedPreferences.getInstance();
          Provider.of<GarbageProvider>(context, listen: false)
              .addGarbage(garbage);
          // await preps.setString(
          //   'x-auth-token',
          //   res.headers['access-token']!,
          // );
          // await preps.setString(
          //   'phone',
          //   jsonDecode(res.body)['phoneNumber'],
          // );
          Navigator.of(context).pop();
        },
      );
    } catch (e) {
      print(e.toString());
      showSnackBar(context, e.toString());
    }
  }

  // get user data
  void getUserData({
    required BuildContext context,
  }) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();

      String? token = pref.getString('x-auth-token');

      if (token == null) {
        pref.setString('x-auth-token', '');
      }

      http.Response tokenRes = await http.post(
        Uri.parse('$uri/isTokenValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!,
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        // get user data
        http.Response userRes = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token,
          },
        );
        Provider.of<UserProvider>(context, listen: false).setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
