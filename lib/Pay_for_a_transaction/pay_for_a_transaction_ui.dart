import 'package:bloom_project/Style/constant.dart';
import 'package:flutter/material.dart';

import '../Components/MyButton.dart';

class PayForATransaction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'دفع لمعاملة',
          style: const TextStyle(
            color: textColor,
            fontFamily: 'font1',
            fontSize: 34.0,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
     //   backgroundColor: Colors.white, // Green color for app bar
      ),
      body: Column(
        children: [
          // Content with white color (excluding app bar)
          Expanded(
            child: Container(
              //color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'من أجل الدفع لإجراء المعاملات يجب عليك أن تقوم بتحويل المبلغ المطلوب لحساب البنك الخاص بالمكتب وإرفاق الإشعار في الأسفل ',
                      style:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        fontFamily: 'font1',
                        color: textColor,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 5.0), // Small space between texts
                    Text('الحساب المطلوب التحويل عليه هو',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        fontFamily: 'font1',
                        color: textColor,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 5.0), // Small space between texts

                    Text('bshab2024',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        fontFamily: 'font1',
                        color: textColor,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 5.0), // Small space between texts
                    /*Text(
                      'تحديد الصورة',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.right,
                    ),*/
                    const SizedBox(height: 5.0), // Small space between texts

                    Padding(
                      padding: EdgeInsets.only(left: 50,bottom: 50, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            // Replace with your image provider
                            backgroundImage: const AssetImage('assets/images/transaction.png'),
                          ),
                          const SizedBox(width: 10.0),
                          IconButton(
                            icon: const Icon(Icons.upload),
                            onPressed: () {},
                          ),
                          const SizedBox(width: 10.0),
                        ],
                      ),
                    ),
                    // Elevated Button in a new Row (inherits white background)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust padding as needed
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Align to right
                        children: [
                          MyButton(
                            fontSize: 24,
                            onsave: () {
                            },
                            width: 150,
                            height: 62,
                            text: 'تأكيد الطلب',
                            color: buttonColor,
                            radius: 15,
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
