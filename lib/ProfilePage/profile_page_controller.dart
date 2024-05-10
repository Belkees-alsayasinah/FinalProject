import 'package:bloom_project/ProfilePage/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfilePageController extends GetxController{

  @override
  Widget get widget => ProfilePage();

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