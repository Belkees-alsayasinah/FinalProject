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
    String D="يُعد الاستثمار أحد أهم مفاتيح تحقيق الاستقرار المالي والأمان في المستقبل. باختصار، هو عملية تخصيص الأموال في أصول أو مشاريع ذات عائد متوقع بهدف تحقيق الربح أو تنمية الثروة.";

    return Scaffold(
      appBar: AppBar(
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
                      image: AssetImage('assets/images/articles.jpg'),
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
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    // Handle article click here (e.g., navigate to article details)
                    print("Article $index clicked!");
                    Get.to(SingleArticleView(title:'الاستثمار: بوابة نحو مستقبل مالي مستقر' ,description: D));

                  },
                  child: articleListItem(context),
                ),
                separatorBuilder: (context, index) => Divider(thickness: 1),
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
      height: MediaQuery.of(context).size.height * 0.15, // Adjust height as needed
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end, // Change to end
              children: [
                Text(
                  'عنوان المقال', // Article Title
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2, // Allow for two lines of text
                  overflow: TextOverflow.ellipsis, // Truncate if text overflows
                ),
                Text(
                  '2024-04-22', // Replace with article date
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
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
