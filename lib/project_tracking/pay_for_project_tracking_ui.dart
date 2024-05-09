import 'package:flutter/material.dart';

class PayForTracking extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'دفع لتتبع مشروع',
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'font1',
            fontSize: 34.0,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF659B5E), // Green color for app bar
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
                      'من أجل الدفع لإجراء عملية تتبع المشروع يجب عليك أن تقوم بتحويل المبلغ المطلوب لحساب البنك الخاص بالمكتب وإرفاق إشعار الدفع في الأسفل',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 5.0), // Small space between texts
                    Text('الحساب المطلوب التحويل عليه هو',
                      style: const TextStyle(
                        color: Color(0xFF659B5E),
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 5.0), // Small space between texts

                    Text('bshab2024',
                      style: const TextStyle(
                        color: Color(0xFF659B5E),
                        fontSize: 16.0,
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
                            backgroundImage: const AssetImage('assets/images/tracking.png'),
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
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              'تأكيد الطلب',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xFF659B5E), // Green color for button
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
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
