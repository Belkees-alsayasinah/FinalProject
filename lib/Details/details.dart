import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'التفاصيل', // Title text
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'font1',
            fontSize: 34.0,
          ), // White text for title
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
                // Set height to half the screen size (minus app bar height)
                height: (MediaQuery.of(context).size.height)/ 2,
                width:(MediaQuery.of(context).size.width)/ 0.75 ,
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
                    const SizedBox(height: 8.0), // Space between texts
                    // ... rest of your container content
                  ],
                ),
              ),
              const SizedBox(height: 16.0), // Space after container
              ElevatedButton(
                onPressed: () {}, // Handle button press
                child: Text(
                  'طلب تواصل', // Button text
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
