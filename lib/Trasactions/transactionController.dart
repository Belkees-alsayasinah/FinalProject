import 'dart:io';
import 'dart:typed_data';
import 'package:bloom_project/Trasactions/transaction_model.dart';
import 'package:bloom_project/Trasactions/transaction_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Config/server_config.dart';
import '../service/info.dart';
import 'package:http/http.dart' as http;

class TransactionController extends GetxController {
  String id;

  TransactionController(this.id);

  late GlobalKey<FormState> formstate;

  late String message;
  late bool loginState;
  late RxBool isLoading;

  late RxList<TransactionModel> models;
  late TransactionService service;
  var d;
  late Rx<File?> selectedFile = Rx<File?>(null);

  @override
  void onInit() {
    print("TransactionController initialized with id: $id");
    super.onInit();
    formstate = GlobalKey<FormState>();
    message = '';
    service = TransactionService();
    loginState = false;
    isLoading = false.obs;
    models = <TransactionModel>[].obs;
    print("TransactionController initialized with id: $id");
    initData(); // Call the method without await
  }

  void initData() async {
    await getdata(id);
  }

  getdata(String id) async {
    isLoading.value = true;
    print("Fetching data for id: $id");
    try {
      d = await service.getTransactions(UserInformation.user_token, id);
      models.assignAll(service.model);
      models.refresh();
    } catch (e) {
      print("Error fetching data: $e");
    }
    isLoading.value = false;
    update();
  }
}
