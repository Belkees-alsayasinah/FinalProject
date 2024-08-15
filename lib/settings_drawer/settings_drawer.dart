import 'package:bloom_project/ChatScreen/chat_view.dart';
import 'package:bloom_project/FirstPage/type_of_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Config/server_config.dart';
import '../Style/constant.dart';
import '../service/info.dart';
import '../service/store.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class SettingsDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const titleStyle = TextStyle(
        fontFamily: 'font1', fontSize: 20, fontWeight: FontWeight.bold);
    return Container(
      width: 200,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(),
              child: Center(
                child: Text(
                  'الإعدادات',
                  style: titleStyle,
                ),
              ),
            ),
            ListTile(
              title: Row(
                textDirection: TextDirection.rtl,
                children: [
                  Icon(
                    Icons.brightness_4_outlined,
                    color: black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'الوضع الليلي',
                    style: titleStyle,
                  ),
                ],
              ),
              onTap: () {
                // اتخذ إجراء عند النقر على عنصر القائمة 1
              },
            ),
            ListTile(
              title: Row(
                textDirection: TextDirection.rtl,
                children: [
                  Icon(
                    Icons.language,
                    color: black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'تغيير اللغة',
                    style: titleStyle,
                  ),
                ],
              ),
              onTap: () {
                Get.to(ChatView());
                // اتخذ إجراء عند النقر على عنصر القائمة 2
              },
            ),
            ListTile(
              title: Row(
                textDirection: TextDirection.rtl,
                children: [
                  Icon(
                    Icons.logout,
                    color: black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'تسجيل الخروج',
                    style: titleStyle,
                  ),
                ],
              ),
              onTap: () {
                onLogout();
              },
            ),
            // يمكنك إضافة المزيد من عناصر القائمة هنا
          ],
        ),
      ),
    );
  }

  Future<void> onLogout() async {
    var response = await http.get(
      Uri.parse(UserInformation.type == 'inv'
          ? ServerConfig.domainNameServer + ServerConfig().investorLogout
          : ServerConfig.domainNameServer + ServerConfig().userLogout),
      headers: {'Authorization': 'Bearer ${UserInformation.user_token}'},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('logout');
      StoreInfo info = StoreInfo();
      Get.offAll(() => TypeOfUser());
      await info.remove("token");
    } else {
      print(response.statusCode);
    }
  }
}
