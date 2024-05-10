import 'package:bloom_project/ChartPage/chart_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChartPageController extends GetxController{

  @override
  Widget get widget => ChartPageView();

  @override
  void onInit() {
    super.onInit();
    // Initialize page-specific data or services here
  }

  @override
  void onClose() {
    super.onClose();
    // Clean up page-specific data or services here
  }
}