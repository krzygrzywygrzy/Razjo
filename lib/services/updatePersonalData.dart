import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:mental_health/const.dart';

class UpdatePersonalData {
  static Future<String> updatePersonalData(
      var name, var surname, var token) async {
    String data = '';
    var api = '/api/User/update';
    var requestBody = jsonEncode({"firstName": '$name', "surname": '$surname'});

    try {
      http.put(Uri.encodeFull("$URL" + "$api"),
          body: requestBody,
          headers: {'Authentication': "Bearer $token"}).then((var response) {
        if (response.statusCode == 200) {
          data = response.body;
          print(data);
        } else
          data = response.statusCode.toString();
        //TODO: finish
      });
    } catch (e) {
      print(e);
    }
    return data;
  }
}
