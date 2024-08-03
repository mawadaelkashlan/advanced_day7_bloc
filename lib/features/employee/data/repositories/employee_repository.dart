import 'dart:convert';

import 'package:day7_bloc/features/employee/data/models/employee.dart';
import 'package:flutter/services.dart';

class EmployeeRepository {
  Future<List<Employee>> getEmployees() async {
    try {
      var result = await rootBundle.loadString('assets/employees.json');
      var employees = json.decode(result);
      return List<Employee>.from(
          employees.map((json) => Employee.fromJson(json)));
    } catch (e) {
      rethrow;
    }
  }
}
