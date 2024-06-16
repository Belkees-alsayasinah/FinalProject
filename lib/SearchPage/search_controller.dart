import 'package:bloom_project/SearchPage/search_model.dart';
import 'package:bloom_project/SearchPage/search_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../service/info.dart';


class SearchPageController extends GetxController {
  late String searchParameter;
  late String id;
  late RxBool isLoad;
  late SearchService service;
  late RxList<SearchModel> models;
  late String message;
  var d;
  late bool state;
  late String typeOfSearch;
  late GlobalKey<FormState> formstate;

  @override
  Future<void> onInit() async {
    super.onInit();
    formstate = GlobalKey<FormState>();
    isLoad = true.obs;
    service = SearchService();
    models = <SearchModel>[].obs;
    message = '';
    typeOfSearch = 'amount';
    await getdata(searchParameter);
  }

  void updateSearchType(String newType) {
    typeOfSearch = newType;
    update();
  }


  getdata(String searchParameter) async {
    d = await service.getResult(UserInformation.user_token, searchParameter, typeOfSearch);
    models.assignAll(service.model);
    models.refresh();
    isLoad.value = false;
    update();
    if (models.isEmpty) {
    } else if (models[0].name == "null") {}
  }
}
