import 'package:bloom_project/Components/MyButton.dart';
import 'package:flutter/material.dart';

import '../Components/TextField.dart';
import '../Style/constant.dart';

class AddProject extends StatelessWidget {
  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "إضافة مشروع- طب تمويل",
          style: const TextStyle(
            color: textColor,
            fontFamily: 'font1', // Replace with your desired font
            fontSize: 34,
          ),
          textAlign: TextAlign.right, // Right-to-left text alignment
        ),
        centerTitle: true,
        backgroundColor:Colors.white , // Green color for app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics:BouncingScrollPhysics(),
          child: Column(
            children: [
              // Row with two TextFormFields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // TextFormField for "المهنة"
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      children: [
                        Text(
                          'المهنة',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            fontFamily: 'font1',
                            color: textColor,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MyTextField(label: '', hint: '', textInputAction:TextInputAction.next , onsave: (value) {},
                          blurRadius: 8, hieght: 50, keyboardType: TextInputType.name, offset: 10, width: 348,),
                      ],
                    )
                  ),
                  const SizedBox(width: 10.0), // Spacing between TextFormFields
                  // TextFormField for "التصنيف"

                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Column(
                        children: [
                          Text(
                            'التصنيف',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              fontFamily: 'font1',
                              color: textColor,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          MyTextField(label: '', hint: '', textInputAction:TextInputAction.next , onsave: (value) {},
                            blurRadius: 8, hieght: 50, keyboardType: TextInputType.name, offset: 10, width: 348,),
                        ],
                      )
                  ),                ],
              ),
              const SizedBox(height: 20), // Reduced space between rows (adjust as needed)
              // TextFormField for "التفاصيل"
              Column(
                children: [
                  Text(
                    'التفاصيل',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontFamily: 'font1',
                      color: textColor,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MyTextField(label: '', hint: '', textInputAction:TextInputAction.next , onsave: (value) {},
                    blurRadius: 8, hieght: 50, keyboardType: TextInputType.name, offset: 10, width: 500,),
                ],
              ),              const SizedBox(height: 8.0),
              const SizedBox(height: 8.0), // Reduced space between rows (adjust as needed)
              // TextFormField for "التفاصيل"
              Column(
                children: [
                  Text(
                    'المبلغ المطلوب',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontFamily: 'font1',
                      color: textColor,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MyTextField(label: '', hint: '', textInputAction:TextInputAction.next , onsave: (value) {},
                    blurRadius: 8, hieght: 50, keyboardType: TextInputType.name, offset: 10, width: 500,),
                ],
              ),                     const SizedBox(height: 8.0),// Reduced space between rows (adjust as needed)
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
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontFamily: 'font1',
                      color: textColor,
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
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontFamily: 'font1',
                      color: textColor,
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
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontFamily: 'font1',
                      color: textColor,
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
                    "عقد الأجار أو الهوية",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontFamily: 'font1',
                      color: textColor,
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
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontFamily: 'font1',
                      color: textColor,
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
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontFamily: 'font1',
                      color: textColor,
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
                    MyButton(
                      fontSize: 34,
                      onsave: () {
                      },
                      width: 300,
                      height: 62,
                      text: 'إضافة المشروع',
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
    );
  }
}
