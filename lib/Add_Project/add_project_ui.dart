import 'package:flutter/material.dart';

class AddProject extends StatelessWidget {
  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "إضافة مشروع- طب تمويل",
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'font1', // Replace with your desired font
            fontSize: 20.0,
          ),
          textAlign: TextAlign.right, // Right-to-left text alignment
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF659B5E), // Green color for app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Row with two TextFormFields
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // TextFormField for "المهنة"
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "المهنة",
                      hintStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                      border: const OutlineInputBorder(),
                      contentPadding: const EdgeInsets.all(10.0),
                    ),
                    textAlign: TextAlign.right, // Right-to-left text alignment
                  ),
                ),
                const SizedBox(width: 10.0), // Spacing between TextFormFields
                // TextFormField for "التصنيف"
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "التصنيف",
                      hintStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                      border: const OutlineInputBorder(),
                      contentPadding: const EdgeInsets.all(10.0),
                    ),
                    textAlign: TextAlign.right, // Right-to-left text alignment
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0), // Reduced space between rows (adjust as needed)
            // TextFormField for "التفاصيل"
            TextFormField(
              decoration: InputDecoration(
                hintText: "التفاصيل",
                hintStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.all(10.0),
              ),
              textAlign: TextAlign.right, // Right-to-left text alignment
              maxLines: null, // Allow multiple lines
            ),
            const SizedBox(height: 8.0),
            const SizedBox(height: 8.0), // Reduced space between rows (adjust as needed)
            // TextFormField for "التفاصيل"
            TextFormField(
              decoration: InputDecoration(
                hintText: "المبلغ المطلوب",
                hintStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.all(10.0),
              ),
              textAlign: TextAlign.right, // Right-to-left text alignment
              maxLines: null, // Allow multiple lines
            ),
            const SizedBox(height: 8.0),// Reduced space between rows (adjust as needed)
            // Row with text and upload button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.upload),
                  onPressed: () {},
                ),
                const SizedBox(width: 10.0),
                Text(
                  "دراسة الجدوى",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.right, // Right-to-left text alignment
                ),

              ],
            ),
            const SizedBox(height: 8.0), // Reduced space between rows (adjust as needed)
            // Row with text and upload button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.upload),
                  onPressed: () {},
                ),
                const SizedBox(width: 10.0),
                Text(
                  "السيرة الذاتية",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.right, // Right-to-left text alignment
                ),

              ],
            ),
            const SizedBox(height: 8.0), // Reduced space between rows (adjust as needed)
            // Row with text and upload button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.upload),
                  onPressed: () {},
                ),
                const SizedBox(width: 10.0),
                Text(
                  "صورة الهوية",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.right, // Right-to-left text alignment
                ),

              ],
            ),
            const SizedBox(height: 8.0), // Reduced space between rows (adjust as needed)
            // Row with text and upload button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.upload),
                  onPressed: () {},
                ),
                const SizedBox(width: 10.0),
                Text(
                  "عقد الهوية أو الأجار",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.right, // Right-to-left text alignment
                ),

              ],
            ),
            const SizedBox(height: 8.0), // Reduced space between rows (adjust as needed)
            // Row with text and upload button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.upload),
                  onPressed: () {},
                ),
                const SizedBox(width: 10.0),
                Text(
                  "صورة شخصية",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.right, // Right-to-left text alignment
                ),

              ],
            ),
            const SizedBox(height: 8.0), // Reduced space between rows (adjust as needed)
            // Row with text and upload button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.upload),
                  onPressed: () {},
                ),
                const SizedBox(width: 10.0),
                Text(
                  "لا حكم عليه",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.right, // Right-to-left text alignment
                ),

              ],
            ),
            const SizedBox(height: 8.0), // Reduced space between rows (adjust as needed)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust padding as needed
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Align to right
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'إضافة المشروع',
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
    );
  }
}
