import 'dart:async'; // إضافة هذه السطر لاستيراد الحزمة
import 'package:bloom_project/ChatScreen/GetMessages/messages_model.dart';
import 'package:bloom_project/ChatScreen/GetMessages/messages_service.dart';
import 'package:get/get.dart';
import '../../service/info.dart';

class GetMessagesController extends GetxController {
  late String id;
  late RxBool isLoad;
  late GetMessagesService service;
  late RxList<MessagesModel> models;
  late String message;
  late bool state;
  Timer? timer;
  bool _disposed = false;
  @override
  Future<void> onInit() async {
    super.onInit();
    isLoad = true.obs;
    service = GetMessagesService();
    models = <MessagesModel>[].obs;
    message = '';
    await getdata();
  }

  getdata() async {
    if (_disposed) return;

    await service.getMessages(UserInformation.user_token);
    models.assignAll(service.model);
    models.refresh();
    isLoad.value = false;
    update();

    if (models.isEmpty) {

    } else if (models[0].content == "null") {

    }


    timer = Timer.periodic(Duration(seconds: 5), (Timer t) async {
      if (_disposed) return;
      await service.getMessages(UserInformation.user_token);
      models.assignAll(service.model);
      models.refresh();
      isLoad.value = false;
      update();
    });
  }

  @override
  void onClose() {
    _disposed = true; // تعيين المتغير إلى true عند التخلص من الـ Controller
    timer?.cancel(); // إلغاء الـ Timer
    super.onClose();
  }
}
