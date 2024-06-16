import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Style/constant.dart';

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
