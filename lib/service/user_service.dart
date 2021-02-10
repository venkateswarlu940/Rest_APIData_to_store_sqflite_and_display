import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:api_storage/model/fetch_api.dart';
import 'package:api_storage/model/user_model2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



final String apiURL = 'https://jsonplaceholder.typicode.com/users';

Future<List<Employee>> fetchJSONData() async {

  var jsonResponse = await http.get(apiURL);

  if (jsonResponse.statusCode == 200) {

    final jsonItems = json.decode(jsonResponse.body).cast<Map<String, dynamic>>();
    // print(jsonItems);

    List<Employee> usersList = jsonItems.map<Employee>((json) {
      return Employee.fromJson(json);
    }).toList();

    return usersList;

  } else {
    throw Exception('Failed to load data from internet');
  }
}