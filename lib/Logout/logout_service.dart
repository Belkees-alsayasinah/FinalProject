import 'dart:convert';
import 'package:bloom_project/HomePage/GetInterestsModel.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import '../Config/server_config.dart';
import '../service/info.dart';

class LogoutService {
  late String message;
  late bool x = false;

//delete
  Future<bool> deleteData(int id) async {
    int s = 1;
    final response = await http.post(
      Uri.parse('http://localhost:8000/api/employee/schedules/delete/$id'),
      headers: {'Authorization': 'Bearer ${UserInformation.user_token}'},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    }

    print(response.statusCode);
    return false;
  }}
