import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import '../Config/server_config.dart';
import '../service/info.dart';
import 'package:http/http.dart' as http;

class DetailsPageController extends GetxController {
  var personalPhoto = Rx<File?>(null);
  var idPhoto = Rx<File?>(null);
  var buttonText = 'تواصل'.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void pickPhotos(String field) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );
      if (result != null) {
        File file = File(result.files.single.path ?? "");
        _onFileSelected(file, field);
      }
    } catch (e) {
      print(e);
    }
  }

  void _onFileSelected(File file, String field) {
    switch (field) {
      case 'personal_photo':
        personalPhoto.value = file;
        break;
      case 'idPhoto':
        idPhoto.value = file;
        break;
      default:
        break;
    }
  }

  Future<void> uploadPhotos(int id) async {
    var headers = {'Authorization': 'Bearer ${UserInformation.user_token}'};
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(ServerConfig.domainNameServer +
          ServerConfig().communicationRequest +
          '$id'),
    );
    print("id: $id");
    print(personalPhoto.value);
    print(idPhoto.value);
    if (personalPhoto.value != null && personalPhoto.value!.lengthSync() > 0) {
      request.files.add(await http.MultipartFile.fromBytes(
        'personal_photo',
        Uint8List.fromList(personalPhoto.value!.readAsBytesSync()),
        filename: personalPhoto.value!.path.split('/').last,
      ));
    }
    if (idPhoto.value != null && idPhoto.value!.lengthSync() > 0) {
      request.files.add(await http.MultipartFile.fromBytes(
        'iD_card',
        Uint8List.fromList(idPhoto.value!.readAsBytesSync()),
        filename: idPhoto.value!.path.split('/').last,
      ));
    }

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200 || response.statusCode == 201) {
      buttonText.value = 'قيد المعالجة';


      Get.back();
    } else {
      print('Error: ${response.reasonPhrase}');
      print('Status Code: ${response.statusCode}');
    }
  }
}
