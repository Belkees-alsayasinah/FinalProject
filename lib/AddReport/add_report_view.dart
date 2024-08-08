import 'package:bloom_project/AddReport/add_report_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Components/MyButton.dart';
import '../Components/TextField.dart';
import '../Style/constant.dart';

class AddReportView extends StatelessWidget {
  final String id;

  AddReportView({required this.id});

  AddReportController controller = Get.put(AddReportController());

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: Text(''),
        centerTitle: true,
        title: Text('إضافة تقرير', // Title text
            style: TextStyle(
              color: textColor,
              fontFamily: 'font1',
              fontSize: 34,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.checklist_outlined,
              color: textColor,
              size: 30,
            ),
          ),
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_forward_ios, color: textColor, size: 30))
        ],
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 70, bottom: 20, left: 30, right: 30),
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: controller.formstate,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  labelText('ملخص الأهداف التي تم تحقيقها:'),
                  MyTextField(
                    label: '',
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller.summaryGoalsAchieved = value!;
                    },
                    keyboardType: TextInputType.emailAddress,
                    blurRadius: 8,
                    offset: 10,
                    width: screenSize.width * 0.9,
                    height: screenSize.height * 0.1,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      if (!value.contains('@') || !value.contains('.')) {
                        return 'Incorrect format';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  labelText('ملخص الأهداف التي لم تتحقق مع السبب:'),
                  MyTextField(
                    label: '',
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller.summaryGoalsNotAchieved = value!;
                    },
                    keyboardType: TextInputType.emailAddress,
                    blurRadius: 8,
                    offset: 10,
                    width: screenSize.width * 0.9,
                    height: screenSize.height * 0.1,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  labelText('المبلغ  المستثمر:'),
                  MyTextField(
                    label: '',
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller.ammountInvested = value!;
                    },
                    keyboardType: TextInputType.emailAddress,
                    blurRadius: 8,
                    offset: 10,
                    width: screenSize.width * 0.9,
                    height: screenSize.height * 0.1,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          labelText('الإيرادات الإجمالية:'),
                          MyTextField(
                            label: '',
                            hint: "",
                            textInputAction: TextInputAction.next,
                            onsave: (value) {
                              controller.totalRevenues = value!;
                            },
                            keyboardType: TextInputType.emailAddress,
                            blurRadius: 8,
                            offset: 10,
                            width: screenSize.width * 0.4,
                            height: screenSize.height * 0.1,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          labelText('التكاليف الإجمالية:'),
                          MyTextField(
                            label: '',
                            hint: "",
                            textInputAction: TextInputAction.next,
                            onsave: (value) {
                              controller.totalCosts = value!;
                            },
                            keyboardType: TextInputType.emailAddress,
                            blurRadius: 8,
                            offset: 10,
                            width: screenSize.width * 0.4,
                            height: screenSize.height * 0.1,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  labelText('الأرباح الصافيه:'),
                  MyTextField(
                    label: '',
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller.netProfit = value!;
                    },
                    keyboardType: TextInputType.emailAddress,
                    blurRadius: 8,
                    offset: 10,
                    width: screenSize.width * 0.9,
                    height: screenSize.height * 0.1,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          labelText('صافي الربح لصاحب العمل:'),
                          MyTextField(
                            label: '',
                            hint: "",
                            textInputAction: TextInputAction.next,
                            onsave: (value) {
                              controller.netProfitWorker = value!;
                            },
                            keyboardType: TextInputType.emailAddress,
                            blurRadius: 8,
                            offset: 10,
                            width: screenSize.width * 0.4,
                            height: screenSize.height * 0.1,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 25,
                          ),
                          labelText('صافي الربح للمستثمر:'),
                          MyTextField(
                              label: '',
                              hint: "",
                              textInputAction: TextInputAction.next,
                              onsave: (value) {
                                controller.netProfitInvestor = value!;
                              },
                              keyboardType: TextInputType.emailAddress,
                              blurRadius: 8,
                              offset: 10,
                              width: screenSize.width * 0.4,
                              height: screenSize.height * 0.1,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'This field is required';
                                }
                                return null;
                              })
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  labelText('المواد المستلمة:'),
                  MyTextField(
                      label: '',
                      hint: "",
                      textInputAction: TextInputAction.next,
                      onsave: (value) {
                        controller.materialsReceived = value!;
                      },
                      keyboardType: TextInputType.emailAddress,
                      blurRadius: 8,
                      offset: 10,
                      width: screenSize.width * 0.9,
                      height: screenSize.height * 0.1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 25,
                  ),
                  labelText('سعر المواد:'),
                  MyTextField(
                      label: '',
                      hint: "",
                      textInputAction: TextInputAction.next,
                      onsave: (value) {
                        controller.materialsPrice = value!;
                      },
                      keyboardType: TextInputType.emailAddress,
                      blurRadius: 8,
                      offset: 10,
                      width: screenSize.width * 0.9,
                      height: screenSize.height * 0.1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 25,
                  ),
                  labelText('إجمالي المبيعات:'),
                  MyTextField(
                      label: '',
                      hint: "",
                      textInputAction: TextInputAction.next,
                      onsave: (value) {
                        controller.totalSales = value!;
                      },
                      keyboardType: TextInputType.emailAddress,
                      blurRadius: 8,
                      offset: 10,
                      width: screenSize.width * 0.9,
                      height: screenSize.height * 0.1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 25,
                  ),
                  labelText('صافي الربح الكلي:'),
                  MyTextField(
                      label: '',
                      hint: "",
                      textInputAction: TextInputAction.next,
                      onsave: (value) {
                        controller.overallNetProfit = value!;
                      },
                      keyboardType: TextInputType.emailAddress,
                      blurRadius: 8,
                      offset: 10,
                      width: screenSize.width * 0.9,
                      height: screenSize.height * 0.1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 25,
                  ),
                  labelText('مبلغ الصيانة (إذا كان هناك):'),
                  MyTextField(
                      label: '',
                      hint: "",
                      textInputAction: TextInputAction.next,
                      onsave: (value) {
                        controller.maintenance = value!;
                      },
                      keyboardType: TextInputType.emailAddress,
                      blurRadius: 8,
                      offset: 10,
                      width: screenSize.width * 0.9,
                      height: screenSize.height * 0.1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 25,
                  ),
                  labelText('مبلغ الأجور والمعاملات:'),
                  MyTextField(
                      label: '',
                      hint: "",
                      textInputAction: TextInputAction.next,
                      onsave: (value) {
                        controller.transactions = value!;
                      },
                      keyboardType: TextInputType.emailAddress,
                      blurRadius: 8,
                      offset: 10,
                      width: screenSize.width * 0.9,
                      height: screenSize.height * 0.1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 25,
                  ),
                  labelText('التوصيات الرئيسية:'),
                  MyTextField(
                      label: '',
                      hint: "",
                      textInputAction: TextInputAction.next,
                      onsave: (value) {
                        controller.recommendations = value!;
                      },
                      keyboardType: TextInputType.emailAddress,
                      blurRadius: 8,
                      offset: 10,
                      width: screenSize.width * 0.9,
                      height: screenSize.height * 0.1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 25,
                  ),
                  labelText('الخطط المستقبلية لتحسين الأداء:'),
                  MyTextField(
                    label: '',
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller.futurePlans = value!;
                    },
                    keyboardType: TextInputType.emailAddress,
                    blurRadius: 8,
                    offset: 10,
                    width: screenSize.width * 0.9,
                    height: screenSize.height * 0.1,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  MyButton(
                    fontSize: 34,
                    onsave: () {
                      controller.onClickAddReport(id);
                      controller.addReportState ? Navigator.pop(context) : null;
                    },
                    width: screenSize.width * 0.9,
                    height: screenSize.height * 0.08,
                    text: 'إرسال التقرير',
                    color: buttonColor,
                    radius: 15,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget labelText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontFamily: 'font1',
        fontWeight: FontWeight.bold,
      ),
      textDirection: TextDirection.rtl,
    );
  }
}
