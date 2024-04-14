import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Style/constant.dart';

class BoardingModel {
  final String image;
  final String title;
  final String image0;
  final String body;

  BoardingModel({
    required this.image,
    required this.image0,
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();
  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'assets/images/onboarding1.jpg',
        image0: 'assets/images/1.png',
        title: 'لديك مشروع بحاجة للتمويل؟',
        body:
            'يمكنك من خلال التطبيق أن تقوم بعرض أعمالك بسهولة، والانتظار للحصول على الاستثمار المناسب، كما يمكنك إدارة مشاريعك والاطلاع على مشاريع الآخربن!'),
    BoardingModel(
        image: 'assets/images/onboarding2.jpg',
        image0: 'assets/images/2.png',
        title: 'هل تريد استثمار مالك في مشاريع فعالة؟',
        body: 'يمكنك من خلال التطبيق أن تستعرض المشاريع التي تحتاج للتمويل والحصول على كافة المعلومات اللازمة تلبيةً لرغباتك، وتتبّع المشاريع بفعالية وانتظام!'),
    BoardingModel(
        image: 'assets/images/onboarding3.jpg',
        image0: 'assets/images/3.png',
        title: 'احصل على عقد موثوق لتحقيق أهدافك',
        body: 'فلو وجدت فرصتك داخل التطبيق سنوفر لك جميع ما تحتاج من العقود القانونية والتتبع اللازم والموثوق للمشاريع خاصتك!'),
  ];

  var isLast = false;

  void submit() {
    // CacheHelper.saveData(key: 'onBoarding', value: true).then(
    //   (value) {
    //     if (value) {
    //       // navigateAndFinish(
    //       //   context,
    //       //   ShopLoginScreen(),
    //       // );
    //     }
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: submit,
            child: Text(
              'SKIP',
              style: TextStyle(
                color: buttonColor,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: boardController,
              physics: BouncingScrollPhysics(),
              onPageChanged: (int index) {
                if (index == boarding.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
              itemBuilder: (context, index) =>
                  buildBoardingItem(boarding[index]),
              itemCount: boarding.length,
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: buttonColor,
                    dotHeight: 10,
                    expansionFactor: 4,
                    dotWidth: 10,
                    spacing: 5.0,
                  ),
                ),
                Spacer(),
                Container(
                  
                  width: 118,
                  height: 52,
                  child: FloatingActionButton(
                    backgroundColor: buttonColor,
                    onPressed: () {
                      if (isLast) {
                        submit();
                      } else {
                        boardController.nextPage(
                          duration: Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: Stack(
            children: [
              Image(
                image: AssetImage('${model.image}'),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset('${model.image0}'),
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${model.title}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'font1',
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  '${model.body}',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'font1',
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ))
      ]);
}
