import 'package:bloom_project/ArticlePage/article_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Style/constant.dart';

class ArticlesView extends StatelessWidget {
  const ArticlesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    String D =
        "يُعد الاستثمار أحد أهم مفاتيح تحقيق الاستقرار المالي والأمان في المستقبل. باختصار، هو عملية تخصيص الأموال في أصول أو مشاريع ذات عائد متوقع بهدف تحقيق الربح أو تنمية الثروة.";

    return Scaffold(
      appBar: AppBar(
        leading: Text(''),
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
            Container(
              height: MediaQuery.of(context).size.height *
                  0.25, // Adjust height as needed
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage('assets/images/articles.jpg'),
                  // Replace with your asset
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              height: screenSize.width * 0.2,
              width: 221,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 0, // انتشار الظل
                    offset: Offset(3, 3), // تحديد الزاوية والاتجاه
                    blurRadius: 4, // وضوح الظل
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'عزز معلوماتك عن الاستثمار',
                  // Enhance your investment knowledge
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'font1'),
                ),
              ),
            ),

            SizedBox(height: 20),

            // List of articles (clickable)
            Expanded(
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    // Handle article click here (e.g., navigate to article details)
                    print("Article $index clicked!");
                    Get.to(SingleArticleView(
                        title: 'الاستثمار: بوابة نحو مستقبل مالي مستقر',
                        description: D));
                  },
                  child: articleListItem(context),
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: 15,
                ),
                itemCount: 5, // Adjust number of articles
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget articleListItem(BuildContext context) {
    return Container(
      height:
          MediaQuery.of(context).size.height * 0.15, // Adjust height as needed
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white70,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0, // انتشار الظل
            offset: Offset(3, 3), // تحديد الزاوية والاتجاه
            blurRadius: 2, // وضوح الظل
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end, // Change to end
                children: [
                  Text(
                    'عنوان المقال', // Article Title
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'font1'),
                    maxLines: 2, // Allow for two lines of text
                    overflow: TextOverflow.ellipsis, // Truncate if text overflows
                  ),
                  Text(
                    '2024-04-22',
                    style: TextStyle(
                        fontSize: 18, color: Colors.grey, fontFamily: 'font1'),
                  ),
                  SizedBox(height: 3,),
                  Text(
                    'يعد الاستثمار عنصرا أساسيا في النمو الاقتصادي...',

                    style: TextStyle(
                        fontSize: 18, color: Colors.grey, fontFamily: 'font1'),
                    textDirection: TextDirection.rtl,
                    maxLines: 1, // Allow for two lines of text
                    overflow: TextOverflow.ellipsis,

                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/article.png', // Replace with your asset
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
