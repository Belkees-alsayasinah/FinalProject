import 'package:bloom_project/AddCanvas/canvas_controller.dart';
import 'package:bloom_project/AddReport/add_report_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Components/MyButton.dart';
import '../Components/TextField.dart';
import '../Style/constant.dart';

class AddCanvasView extends StatelessWidget {
  final String id;

  AddCanvasView({required this.id});

  AddCanvasController controller = Get.put(AddCanvasController());

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: Text(''),
        centerTitle: true,
        title: Text('مخطط نموذج الأعمال', // Title text
            style: TextStyle(
              color: textColor,
              fontFamily: 'font1',
              fontSize: 23,
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
                  labelText('من هو الجمهور المستهدف:'),
                  MyTextField(
                    label: '',
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller.target_audience = value!;
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
                  labelText('من هم العملاء الذين يستخدمهم:'),
                  MyTextField(
                    label: '',
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller.customers_using_our_products_or_services =
                          value!;
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
                  labelText('ما هي شرائح العملاء:'),
                  MyTextField(
                    label: '',
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller.customer_segments = value!;
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
                  labelText('من هم عملائنا الاكثر اهمية:'),
                  MyTextField(
                    label: '',
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller.most_important_customers = value!;
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
                  labelText('كيف سنتفاعل مع الجمهور:'),
                  MyTextField(
                    label: '',
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller.interacting_with_audience = value!;
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
                  labelText('كيف سنقوي علاقتنا بهم :'),
                  MyTextField(
                    label: '',
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller.strengthening_our_relationship_with_them =
                          value!;
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
                  labelText('ما الذي يميز علاقتنا بهم عن منافسينا:'),
                  MyTextField(
                    label: '',
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller
                              .differentiating_our_relationship_from_competitors =
                          value!;
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
                  labelText('ما هي تكاليف بناء هذه العلاقة:'),
                  MyTextField(
                      label: '',
                      hint: "",
                      textInputAction: TextInputAction.next,
                      onsave: (value) {
                        controller.costs_of_building_relationship = value!;
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
                  labelText('كيف سيعرف الجمهور بوجودنا:'),
                  MyTextField(
                      label: '',
                      hint: "",
                      textInputAction: TextInputAction.next,
                      onsave: (value) {
                        controller.raising_awareness_of_our_existence = value!;
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
                  labelText('ما هي طرق التواصل التي يفضلها الجمهور:'),
                  MyTextField(
                      label: '',
                      hint: "",
                      textInputAction: TextInputAction.next,
                      onsave: (value) {
                        controller.preferred_communication_methods_of_audience =
                            value!;
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
                  labelText('ما هي طرق التواصل الافضل:'),
                  MyTextField(
                      label: '',
                      hint: "",
                      textInputAction: TextInputAction.next,
                      onsave: (value) {
                        controller.optimal_communication_methods = value!;
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
                  labelText('ما هي طرق التوصيل الاقل كلفة:'),
                  MyTextField(
                      label: '',
                      hint: "",
                      textInputAction: TextInputAction.next,
                      onsave: (value) {
                        controller.cost_effective_delivery_methods = value!;
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
                  labelText('ما هي القيمة التي نضيفها للجمهور:'),
                  MyTextField(
                      label: '',
                      hint: "",
                      textInputAction: TextInputAction.next,
                      onsave: (value) {
                        controller.value_proposition_for_audience = value!;
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
                  labelText('اي مشاكل الجمهور نقوم بحلها:'),
                  MyTextField(
                      label: '',
                      hint: "",
                      textInputAction: TextInputAction.next,
                      onsave: (value) {
                        controller.problems_of_audience_we_solve = value!;
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
                  labelText('ما هي المنتجات التي نقدمها لكل شريحة:'),
                  MyTextField(
                      label: '',
                      hint: "",
                      textInputAction: TextInputAction.next,
                      onsave: (value) {
                        controller.products_offered_to_each_customer_segment =
                            value!;
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
                  labelText('ما هي احتياجات الجمهور التي نحققها:'),
                  MyTextField(
                    label: '',
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller.audience_needs_we_fulfill = value!;
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
                  labelText('ما هي الأنشطة المطلوبة منتجاتنا:'),
                  MyTextField(
                    label: '',
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller.required_activities_for_our_products = value!;
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
                  labelText('ما هي الأنشطة المطلوبة لقنوات التواصل:'),
                  MyTextField(
                    label: '',
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller
                              .required_activities_for_communication_channels =
                          value!;
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
                  labelText('ما هي الأنشطة المطلوبة للعلاقة مع الجمهور:'),
                  MyTextField(
                    label: '',
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller
                              .required_activities_for_audience_relationships =
                          value!;
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
                  labelText('ما هي الأنشطة المطلوبة للايرادات:'),
                  MyTextField(
                    label: '',
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller.required_activities_for_revenue_generation =
                          value!;
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
                  labelText('ما هي الموارد المطلوبة لبناء المنتج:'),
                  MyTextField(
                    label: '',
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller.resources_required_for_product_development =
                          value!;
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
                  labelText('ما هي الموارد المطلوبة للعلاقة مع العملاء:'),
                  MyTextField(
                    label: '',
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller.resources_required_for_customer_relationships =
                          value!;
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
                  labelText('ما هي الموارد المطلوبة للايرادات:'),
                  MyTextField(
                    label: '',
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller.resources_required_for_revenue_generation =
                          value!;
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
                  labelText('من هم الشركاء الرئيسيون:'),
                  MyTextField(
                    label: '',
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller.key_partners = value!;
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
                  labelText('من هم الموردون الرئيسيون:'),
                  MyTextField(
                    label: '',
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller.key_suppliers = value!;
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
                  labelText('ما هي الموارد الرئيسية التي ستطلبها من شركائنا:'),
                  MyTextField(
                    label: '',
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller.key_resources_requested_from_partners = value!;
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
                  labelText('ما هي الانشطة الرئيسية التي سينفذها شركاؤنا:'),
                  MyTextField(
                    label: '',
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller.key_activities_executed_by_partners = value!;
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
                  labelText('ما هي المنتجات التي سيدفع الجمهور من اجلها:'),
                  MyTextField(
                    label: '',
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller.products_audience_pays_for = value!;
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
                  labelText('كيف يدفعون حاليا:'),
                  MyTextField(
                    label: '',
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller.current_payment_methods = value!;
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
                  labelText('كيف يفضلون ان يدفعون:'),
                  MyTextField(
                    label: '',
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller.preferred_payment_methods = value!;
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
                  labelText('ما هي نسبة ايرادات كل منتج بالنسبة للمشروع:'),
                  MyTextField(
                    label: '',
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller.revenue_percentage_per_product_for_project =
                          value!;
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
                  labelText('ما هي اهم التكاليف لهذا المشروع:'),
                  MyTextField(
                    label: '',
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller.major_costs_for_project = value!;
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
                  labelText('ما هي الموارد الرئيسية الاكثر تكلفة:'),
                  MyTextField(
                    label: '',
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller.most_costly_key_resources = value!;
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
                  labelText('ما هي الانشطة الرئيسية الاكثر تكلفة:'),
                  MyTextField(
                    label: '',
                    hint: "",
                    textInputAction: TextInputAction.next,
                    onsave: (value) {
                      controller.most_costly_key_activities = value!;
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
                      controller.onClickAddCanvas(id);
                    },
                    width: screenSize.width * 0.9,
                    height: screenSize.height * 0.1,
                    text: 'إرسال النموذج',
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
