
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:testapp/Apis/Create_apis.dart';
import 'package:testapp/Models/EmployeeModel.dart';

class ProfileNotifier extends ChangeNotifier {
  TextEditingController empNmae=TextEditingController();
  TextEditingController empJobName=TextEditingController();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _issubcatLoading = false;
  bool get issubcatLoading => _issubcatLoading;

  String? initcatId;

  EmployeeModel? _employeeList;
  EmployeeModel? get employeeList => _employeeList;
  set setEmployeedata(EmployeeModel value) {
    _employeeList = value;
    notifyListeners();
  }


  Future<Response?> employeeGetdata() async {
    _isLoading = true;
    notifyListeners();
    var response = await CreateApis.getEmployeeData( );
    if (response == null) {
    } else if (response.statusCode == 200) {
     
      setEmployeedata =employeeModelFromJson (response.body);
       _isLoading = false;
      notifyListeners();
      return response;
    } else {
      _isLoading = false;
      notifyListeners();
    }
    _isLoading = false;

    notifyListeners();
    return null;
  }

    Future<Response?> employeeSavedata() async {
    _issubcatLoading = true;
    notifyListeners();
    var response = await CreateApis.employeepost( 
      empNmae.text,
      empJobName.text,
    );
    if (response == null) {
    } else if (response.statusCode == 201) {
       _issubcatLoading = false;
      notifyListeners();
      return response;
    } else {
      _issubcatLoading = false;
      notifyListeners();
    }
    _issubcatLoading = false;

    notifyListeners();
    return null;
  }

}