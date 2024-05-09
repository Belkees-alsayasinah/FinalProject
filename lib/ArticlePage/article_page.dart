import 'package:flutter/material.dart';
/* */import 'package:bloom_project/ArticlePage/article_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Style/constant.dart';

class SingleArticleView extends StatelessWidget {
  final String title; // Title of the article
  final String description; // Description of the article

  const SingleArticleView({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: Text(''),
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_forward_ios, color: textColor, size: 30))
        ],
        centerTitle: true,
        title: Text(
          'المقالات', // Articles
          style: TextStyle(
            color: textColor,
            fontFamily: 'font1',
            fontSize: 34,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
        child: Column(
          children: [
            // Banner image and text
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.25, // Adjust height as needed
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage('assets/images/article1.jpg'),
                      // Replace with your asset
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  // bottom: 10.0,
                  right: 10.0,
                  top: screenSize.height * 0.3,
                  child: Text(
                    'عزز معلوماتك عن الاستثمار',
                    // Enhance your investment knowledge
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // List of articles (clickable)
            Expanded(
              child: Column( // Use Column for vertical layout
                children: [
                  // Text box for title
                  Text(
                    'أهمية الاستثمار', // Article Title (replace with actual title)
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10), // Add some spacing between title and description

                  // Container for article content (scrollable)
                  Expanded( // Make the container itself scrollable
                    child: SingleChildScrollView(
                      child: Container( // Container for article description
                        padding: EdgeInsets.all(10), // Add padding for readability
                        child: Text(
                          'يُعد الاستثمار أحد أهم مفاتيح تحقيق الاستقرار المالي والأمان في المستقبل.', // Replace with actual description
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
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
  }}
