// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';

import 'package:http/http.dart' as http;



class CreateApis{
   static Future<http.Response?> getEmployeeData() async {
    String url="https://reqres.in/api/users?page=2";
   http.Response? _res = await http.get(
        Uri.parse(url),
      );

    if (_res != null) {
      return _res;
    } else {
      return _res;
    }
}
static Future<http.Response?> employeepost(
      String name,
      String jobName,
    ) async {
    String url="https://reqres.in/api/users";
    var postBody = {
      "name": name,
      "job": jobName,
    };
     var body= json.encode(postBody);

    http.Response? _res = await http.post(
       Uri.parse(url),
       body: body);

    if (_res != null) {
      return _res;
    } else {
      return _res;
    }
}
}