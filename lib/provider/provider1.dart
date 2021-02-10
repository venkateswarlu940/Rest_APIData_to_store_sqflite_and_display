
import 'package:api_storage/model/fetch_api.dart';
import 'package:api_storage/model/user_model2.dart';
import 'package:dio/dio.dart';

import 'db_helper.dart';

class EmployeeApiProvider {
  Future<List<Employee>> getAllEmployees() async {
    var url = "https://jsonplaceholder.typicode.com/users";
    Response response = await Dio().get(url);

    return (response.data as List).map((employee) {
      print('Inserting $employee');
      DBProvider.db.createEmployee(Employee.fromJson(employee));
    }).toList();
  }
}