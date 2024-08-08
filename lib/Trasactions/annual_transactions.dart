import 'package:bloom_project/Style/constant.dart';
import 'package:bloom_project/Trasactions/transactionController.dart';
import 'package:bloom_project/Trasactions/transaction_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Components/MyDetailsPage.dart';

class AnnualTransactions extends StatelessWidget {
  final String id;

  const AnnualTransactions({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return MyDetailsPage(
      appTitle: 'المعاملات',
      buttonWidget: Positioned.directional(
        textDirection: TextDirection.ltr,
        bottom: 10,
        end: 0,
        start: 0,
        child: Padding(
          padding: EdgeInsets.only(
              right: screenSize.width * 0.34, left: screenSize.width * 0.34),
        ),
      ),
      onsave: () {},
      widget: GetBuilder<TransactionController>(
        init: TransactionController(id),
        builder: (controller) {
          print("id: " + id);
          return controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(
                    color: textColor,
                  ),
                )
              : controller.models.isEmpty
                  ? Center(
                      child: Text(
                        'لا يوجد معاملات بعد!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'font1',
                          fontSize: screenSize.shortestSide * 0.07,
                          color: textColor,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Align(
                              alignment: Alignment.centerRight,
                              child: Row(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Get.to(TransactionDetails(
                                        id: controller
                                            .models[index].transaction.id
                                            .toString(),
                                        name: controller
                                            .models[index].transaction.name,
                                        price: controller
                                            .models[index].transaction.price,
                                        description: controller.models[index]
                                            .transaction.description,
                                        discount: controller
                                            .models[index].transaction.discount,
                                        status: controller
                                            .models[index].transaction.status,
                                      ));
                                    },
                                    child: Text(
                                      controller.models[index].transaction.name,
                                      style: TextStyle(
                                          fontSize: screenSize.width * 0.05,
                                          color: black),
                                      textAlign: TextAlign.right,
                                    ),
                                    style: TextButton.styleFrom(
                                      alignment: Alignment.centerRight,
                                    ),
                                  ),
                                  Icon(Icons.arrow_right),
                                  Text(
                                    controller.models[index].transaction.price,
                                    style: TextStyle(
                                      fontSize: screenSize.width * 0.04,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 20,
                            );
                          },
                          itemCount: controller.models.length,
                        ),
                      ),
                    );
        },
      ),
    );
  }
}
