import 'package:flutter/material.dart';

class CommunicationRequestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'التفاصيل', // Title text
          style:  TextStyle(
        color: Colors.white,
        fontFamily: 'font1',
        fontSize: 34,), // White text for title
        ),
        centerTitle: true, // Center the title
        backgroundColor: const Color(0xFF659B5E), // Half-height green background
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF556F44), // Dark green container color
                  boxShadow:  [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3), // Subtle shadow
                      blurRadius: 5.0, // Adjust blur radius for shadow intensity
                      spreadRadius: 2.0, // Adjust spread radius for shadow spread
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                ),
                padding: const EdgeInsets.all(16.0), // Padding within the container
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end, // Right-align text
                  children: [
                    Text(
                      'طلب تواصل', // Text on the right
                      style: const TextStyle(fontSize: 18.0), // Adjust font size
                      textDirection: TextDirection.rtl, // Make text RTL
                    ),
                    const SizedBox(height: 8.0), // Space between texts
                    Row(
                      // Order reversed for RTL layout
                      children: [
                        Expanded( // Flexible TextFormField for user input
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'أدخل المبلغ', // Hint text for TextFormField
                              hintStyle: const TextStyle(color: Colors.white), // White hint text
                            ),
                          ),
                        ),
                        const SizedBox(width: 8.0), // Space before text
                        Text(
                          'المبلغ المراد الاستثمار فيه:', // Left text (RTL order)
                          style: const TextStyle(fontSize: 16.0), // Adjust font size
                          textDirection: TextDirection.rtl, // Make text RTL
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0), // Space after TextFormField
                  ],
                ),
              ),
              const SizedBox(height: 16.0), // Space after container
              ElevatedButton(
                onPressed: () {}, // Handle button press
                child: Text(
                  'تأكيد الطلب', // Button text
                  style: const TextStyle(color: Colors.white), // White text
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF659B5E), // Green background
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
