import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import '../Config/server_config.dart';
import '../service/info.dart';
import 'package:http/http.dart' as http;

class DetailsPageController extends GetxController {

  late Rx<File?> personal_photo = Rx<File?>(null);
  late Rx<File?> idPhoto = Rx<File?>(null);
  late String message;
  late bool loginState;
  late RxBool isLoading;
  late String fileName;
  late String fileName1;
  late Rx<File?> selectedFile = Rx<File?>(null);

  @override
  void onInit() {
    message = '';
    loginState = false;
    isLoading = false.obs;
    super.onInit();
  }

  void pickPhotos(String field) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false, // Change to false to ensure single file selection
      );
      if (result != null) {
        File file = File(result.files.single.path ?? "");
        _onFileSelected(file, field);
        update();
      }
    } catch (e) {
      print(e);
    }
  }

  void _onFileSelected(File file, String field) {
    switch (field) {
      case 'personal_photo':
        fileName1 = file.path.split(r'/').last;
        personal_photo.value = file;
        break;
      case 'idPhoto':
        fileName = file.path.split(r'/').last;
        idPhoto.value = file;
        break;
      default:
        break;
    }
  }

  var uploaded = false;

  Future<void> uploadPhotos(int id) async {
    var headers = {'Authorization': 'Bearer ${UserInformation.user_token}'};
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(ServerConfig.domainNameServer + ServerConfig().communicationRequest + '$id'),
    );
    if (personal_photo.value != null &&
        personal_photo.value!.lengthSync() > 0) {
      request.files.add(
        await http.MultipartFile.fromBytes(
          'personal_photo',
          Uint8List.fromList(personal_photo.value!.readAsBytesSync()),
          filename: fileName1,
        ),
      );
    }
    if (idPhoto.value != null && idPhoto.value!.lengthSync() > 0) {
      request.files.add(
        await http.MultipartFile.fromBytes(
          'iD_card',
          Uint8List.fromList(idPhoto.value!.readAsBytesSync()),
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
    } else {
      print(response.reasonPhrase);
      print(response.statusCode);
      print('error');
    }
  }
}
