import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:archive/archive.dart';
import 'package:bloom_project/AddCanvas/canvas_view.dart';
import 'package:bloom_project/HomePage/basic_page.dart';
import 'package:bloom_project/Profile/profile_controller.dart';
import 'package:bloom_project/RegisterPage/register_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import '../Config/server_config.dart';
import '../service/info.dart';
import 'package:http/http.dart' as http;

class AddProjectController extends GetxController {
  // final UserProfilePageController controller = Get.put(UserProfilePageController(id));
  late RxString sector;
  late GlobalKey<FormState> formstate;
  late String title;
  late String description;
  late String amount;
  late Rx<File?> idPhoto = Rx<File?>(null);
  late Rx<File?> personalPhoto = Rx<File?>(null);
  late Rx<File?> contract = Rx<File?>(null);
  late Rx<File?> notRule = Rx<File?>(null);

  late String message;
  late bool loginState;
  late RxBool isLoading;
  late String fileName2;
  late String fileName3;
  late String fileName4;
  late String fileName5;
  List<int> indexes = [];
  late Rx<File?> selectedFile = Rx<File?>(null);

  late int projectId; // متحول جديد لحفظ الـ id

  @override
  void onInit() {
    formstate = GlobalKey<FormState>();
    sector = ''.obs;
    title = '';
    description = '';
    message = '';
    loginState = false;
    isLoading = false.obs;
    super.onInit();
  }

  void setIndex(List<int> index) {
    indexes = index;
    uploadPdf();
  }

  void pickPdf(String field) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: true,
      );
      if (result != null) {
        File file = File(result.files.single.path ?? "");
        switch (field) {
          case 'idPhoto':
            fileName2 = file.path.split(r'/').last;
            break;
          case 'personalPhoto':
            fileName3 = file.path.split(r'/').last;
            break;
          case 'contract':
            fileName4 = file.path.split(r'/').last;
            break;
          case 'notRule':
            fileName5 = file.path.split(r'/').last;
            break;
          default:
            break;
        }

        print("gg: $file");
        _onFileSelected(file, field);
        update();
      }
    } catch (e) {
      print(e);
    }
  }

  void _onFileSelected(File file, String field) {
    switch (field) {
      case 'idPhoto':
        idPhoto.value = file;
        break;
      case 'personalPhoto':
        personalPhoto.value = file;
        break;
      case 'contract':
        contract.value = file;
        break;
      case 'notRule':
        notRule.value = file;
        break;
      default:
        break;
    }
  }

  var uploaded = false;

  Future<void> uploadPdf() async {
    var headers = {
      'Authorization': 'Bearer ${UserInformation.user_token}',
    };
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(ServerConfig.domainNameServer + ServerConfig().addProject),
    );
    request.fields.addAll({
      'name': title,
      'description': description,
      'location': 'damascus',
      'amount': amount,
      'type_id': sector.value,
    });
    for (int index in indexes) {
      request.fields['interests[]'] = index.toString();
    }

    if (idPhoto.value != null && idPhoto.value!.lengthSync() > 0) {
      request.files.add(
        await http.MultipartFile.fromBytes(
          'iD_card',
          Uint8List.fromList(idPhoto.value!.readAsBytesSync()),
          filename: fileName2,
        ),
      );
    }
    if (personalPhoto.value != null && personalPhoto.value!.lengthSync() > 0) {
      request.files.add(
        await http.MultipartFile.fromBytes(
          'personal_photo',
          Uint8List.fromList(personalPhoto.value!.readAsBytesSync()),
          filename: fileName3,
        ),
      );
    }
    if (contract.value != null && contract.value!.lengthSync() > 0) {
      request.files.add(
        await http.MultipartFile.fromBytes(
          'property_deed',
          Uint8List.fromList(contract.value!.readAsBytesSync()),
          filename: fileName4,
        ),
      );
    }
    if (notRule.value != null && notRule.value!.lengthSync() > 0) {
      request.files.add(
        await http.MultipartFile.fromBytes(
          'clean_record',
          Uint8List.fromList(notRule.value!.readAsBytesSync()),
          filename: fileName5,
        ),
      );
    }

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    var responseData = await response.stream.bytesToString();
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("200");
      uploaded = true;
      selectedFile.value = null;

      var jsonResponse = json.decode(responseData);
      projectId = jsonResponse['data']['id']; // استخراج الـ id من الريسبونس
      // await controller.getdata();
      Get.to(AddCanvasView(id: projectId.toString()));
    } else {
      print(responseData); // طباعة تفاصيل الخطأ
      print(response.reasonPhrase);
      print(response.statusCode);
      print('error');
    }
  }
}
