import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Style/constant.dart';

class SettingsDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  style: TextStyle(
                      fontSize: 35, color: textColor, fontFamily: 'font1'),
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
                    style: TextStyle(
                        color: black, fontSize: 27, fontFamily: 'font1'),
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
                    style: TextStyle(
                        color: black, fontSize: 27, fontFamily: 'font1'),
                  ),
                ],
              ),
              onTap: () {
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
                    style: TextStyle(
                        color: black, fontSize: 27, fontFamily: 'font1'),
                  ),
                ],
              ),
              onTap: () {
                // اتخذ إجراء عند النقر على عنصر القائمة 3
              },
            ),
            // يمكنك إضافة المزيد من عناصر القائمة هنا
          ],
        ),
      ),
    );
  }
}
