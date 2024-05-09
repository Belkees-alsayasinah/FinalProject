import 'package:flutter/material.dart';

class AnnualTransactions extends StatelessWidget {
  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "المعاملات السنوية", // Transaction Details
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'font1', // Replace with your desired font
            fontSize: 34,
          ),
          textAlign: TextAlign.right, // Right-to-left text alignment
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF659B5E), // Green color for app bar (optional)
      ),
      body: Padding(

        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 500,
          width: 400,
          decoration: BoxDecoration(
            color: Color(0xFF556F44),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Stack( // Use Stack for overlapping elements
            children: [
              // Existing content
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  textDirection: TextDirection.rtl,
                  children: [
                    // Row 1 with details text and point
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "1. الضرائب السنوية", // Detail 1
                          style: const TextStyle(
                            fontFamily: 'font1',
                            color: Colors.white,
                            fontSize: 28,                    ),
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),////////

                    const SizedBox(height: 8.0), // Spacing between rows
                    // Row 3 with details text and point
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "2. تجديد العقد والوثائق القانونية", // Detail 1
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 28,                        fontFamily: 'font1'
                          ),
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,

                        ),
                      ],
                    ),////////

                    const SizedBox(height: 16.0), // Larger space before centered text

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "3. تجديد العقد", // Detail 1
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 28, fontFamily: 'font1'
                          ),
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,

                        ),
                      ],
                    ),

                    const SizedBox(height: 16.0), // Larger space before centered text
                    // Row 4 with centered text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "المبلغ المطلوب لجميع المعاملات هو", // This is additional explanatory text
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 28, fontFamily: 'font1'
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0), // Larger space before centered text
                    // Row 4 with centered text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "\$700", // This is additional explanatory text
                          style: const TextStyle(

                              color: Colors.white,
                              fontSize: 28, fontFamily: 'font1'
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),)  ,            // Positioned button
              Positioned(
                bottom: 10, // Adjust position as needed
                right: 140, // Adjust position as needed
                child: TextButton(
                  onPressed: () {
                    // Handle button press event
                    print('Button pressed');
                  },
                  child: Text(
                    "الاستمرار", // Continue
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'font1',
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF659B5E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
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
