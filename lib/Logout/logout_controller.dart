import 'package:bloom_project/FirstPage/type_of_user.dart';
import 'package:bloom_project/Logout/logout_service.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../service/info.dart';

class LogoutController extends GetxController {
  late LogoutService service;
  late String message;
  late bool state;

  @override
  void onInit() async {
    service = LogoutService();
    message = '';

  }

  //delete
  ondelete(int id) async {
    state = await service.deleteData(id);
    if (state) {
      print('suii');
    } else {
      print('noop');
    }
  }
}
