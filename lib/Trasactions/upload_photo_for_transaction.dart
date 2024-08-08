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

class UploadPhotoTransactionController extends GetxController {
  String id;

  UploadPhotoTransactionController(this.id);

  late GlobalKey<FormState> formstate;
  late Rx<File?> image = Rx<File?>(null);
  late String message;
  late bool loginState;
  late RxBool isLoading;
  late String filePath;
  late String fileName;
  late String nameF;
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
    print("TransactionController initialized with id gg: $id");
  }

  void pickPdf() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: true,
      );
      if (result != null) {
        File file = File(result.files.single.path ?? "");
        fileName = file.path.split(r'/').last;
        filePath = file.path;
        _onFileSelected(file);
        update();
      }
    } catch (e) {
      print("Error picking file: $e");
    }
  }

  void _onFileSelected(File file) {
    image.value = file;
  }

  var uploaded = false;

  Future<void> uploadPdf() async {
    var headers = {'Authorization': 'Bearer ${UserInformation.user_token}'};
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(ServerConfig.domainNameServer +
          ServerConfig().requestTransaction +
          '$id/request'),
    );
    print(ServerConfig.domainNameServer +
        ServerConfig().requestTransaction +
        '$id/request');
    if (image.value != null) {
      request.files.add(
        await http.MultipartFile.fromBytes(
          'image',
          Uint8List.fromList(image.value!.readAsBytesSync()),
          filename: fileName,
        ),
      );
    }

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200 || response.statusCode == 201) {
      uploaded = true;
      selectedFile.value = null;
      Get.back();

      update();
    } else {
      print(response.reasonPhrase);
      print(response.statusCode);
      print('error');
    }
  }
}
