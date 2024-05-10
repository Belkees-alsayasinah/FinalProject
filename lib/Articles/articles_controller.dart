import 'package:bloom_project/Articles/articles_model.dart';
import 'package:bloom_project/Articles/articles_page.dart';
import 'package:bloom_project/Articles/articles_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../service/info.dart';

class ArticlesController extends GetxController {
  @override
  Widget get widget => ArticlesView();
  late RxBool isLoad;
  late ArticlesService service;
  late RxList<ArticlesModel> models;
  late String message;
  var d;
  late bool state;
  late GlobalKey<FormState> formstate;


  @override
  void onClose() {
    super.onClose();
    // Clean up page-specific data or services here
  }
  @override
  void onInit() async {
    formstate = GlobalKey<FormState>();

    isLoad = true.obs;
    service = ArticlesService();
    models = <ArticlesModel>[].obs;
    message = '';

    await getdata();
  }

  getdata() async {
    print("1");
    d = await service.getArticles(UserInformation.user_token);
    models.value.assignAll(service.model);
    models.refresh();
    isLoad.value = false;
    if (models.isEmpty) {
      print("null");
    } else if (models[0].name == "null") {

    }
  }
}
