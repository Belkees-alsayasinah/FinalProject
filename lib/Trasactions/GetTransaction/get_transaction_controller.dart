import 'package:bloom_project/Trasactions/GetTransaction/get_transaction_model.dart';
import 'package:bloom_project/Trasactions/GetTransaction/get_transaction_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../service/info.dart';

class GetTransactionController extends GetxController {
String userId;

GetTransactionController(this.userId);

late String id;
late RxBool isLoad;
late GetTransactionsService service;
late RxList<GetTransactionModel> models;
late String message;
var d;
late bool state;
late GlobalKey<FormState> formstate;

@override
Future<void> onInit() async {
super.onInit();
formstate = GlobalKey<FormState>();
isLoad = true.obs;
service = GetTransactionsService();
models = <GetTransactionModel>[].obs;
message = '';
await getdata(userId);
}

getdata(String userId) async {
d = await service.getTransaction(UserInformation.user_token, userId);
models.assignAll(service.model);
models.refresh();
isLoad.value = false;
update();
if (models.isEmpty) {
} else if (models[0].description == "null") {}
}
}
