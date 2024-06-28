import 'package:bloom_project/Components/MyTable.dart';
import 'package:bloom_project/GetCanvas/get_canvas_controller.dart';
import 'package:bloom_project/Style/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class TableView extends StatelessWidget {
  GetCanvasController controller = Get.find();

  @override
  Widget build(BuildContext context) {
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
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_forward_ios, color: textColor, size: 30))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
                MyTable(
                    title: 'الجمهور المستهدف',
                    text: controller.models[0].targetAudience),
                MyTable(
                    title: 'العملاء الذين يستفيدون',
                    text: controller
                        .models[0].customersUsingOurProductsOrServices),
                MyTable(
                    title: 'شرائح العملاء',
                    text: controller.models[0].customerSegments),
                MyTable(
                    title: 'عملائنا الاكثر اهمية',
                    text: controller.models[0].mostImportantCustomers),
                MyTable(
                    title: 'كيفية التفاعل مع الجمهور ',
                    text: controller.models[0].interactingWithAudience),
                MyTable(
                    title: ' تعزيز علاقتنا مع الجمهور ',
                    text: controller
                        .models[0].strengtheningOurRelationshipWithThem),
                MyTable(
                    title: 'تمييز علاقتنا عن المنافسين ',
                    text: controller.models[0]
                        .differentiatingOurRelationshipFromCompetitors),
                MyTable(
                    title: 'تكاليف بناء العلاقة ',
                    text: controller.models[0].costsOfBuildingRelationship),
                MyTable(
                    title: 'زيادة الوعي بوجودنا ',
                    text: controller.models[0].raisingAwarenessOfOurExistence),
                MyTable(
                    title: 'طرق التواصل المفضلة للجمهور',
                    text: controller
                        .models[0].preferredCommunicationMethodsOfAudience),
                MyTable(
                    title: 'أفضل طرق التواصل ',
                    text: controller.models[0].optimalCommunicationMethods),
                MyTable(
                    title: 'طرق توصيل فعالة من حيث التكلفة ',
                    text: controller.models[0].costEffectiveDeliveryMethods),
                MyTable(
                    title: 'القيمة المقدمة للجمهور ',
                    text: controller.models[0].valuePropositionForAudience),
                MyTable(
                    title: 'المشاكل التي نحلها للجمهور ',
                    text: controller.models[0].problemsOfAudienceWeSolve),
                MyTable(
                    title: 'المنتجات المقدمة لكل فئة من العملاء ',
                    text: controller
                        .models[0].productsOfferedToEachCustomerSegment),
                MyTable(
                    title: 'تلبية احتياجات الجمهور ',
                    text: controller.models[0].audienceNeedsWeFulfill),
                MyTable(
                    title: 'الأنشطة المطلوبة لمنتجاتنا  ',
                    text:
                        controller.models[0].requiredActivitiesForOurProducts),
                MyTable(
                    title: 'الأنشطة المطلوبة لقنوات الاتصال ',
                    text: controller
                        .models[0].requiredActivitiesForCommunicationChannels),
                MyTable(
                    title: 'الأنشطة المطلوبة لبناء العلاقات مع الجمهور  ',
                    text: controller
                        .models[0].requiredActivitiesForAudienceRelationships),
                MyTable(
                    title: 'الأنشطة المطلوبة لتوليد الإيرادات ',
                    text: controller
                        .models[0].requiredActivitiesForRevenueGeneration),
                MyTable(
                    title: 'الموارد المطلوبة لتطوير المنتج ',
                    text: controller
                        .models[0].resourcesRequiredForProductDevelopment),
                MyTable(
                    title: 'الموارد المطلوبة لعلاقات العملاء ',
                    text: controller
                        .models[0].resourcesRequiredForCustomerRelationships),
                MyTable(
                    title: 'الموارد المطلوبة لتوليد الإيرادات ',
                    text: controller
                        .models[0].resourcesRequiredForRevenueGeneration),
                MyTable(
                    title: 'كالشركاء الرئيسيون ',
                    text: controller.models[0].keyPartners),
                MyTable(
                    title: 'الموردين الرئيسيون',
                    text: controller.models[0].keySuppliers),
                MyTable(
                    title: 'لموارد الرئيسية التي سنطلبها من الشركاء ',
                    text:
                        controller.models[0].keyResourcesRequestedFromPartners),
                MyTable(
                    title: 'الأنشطة الرئيسية التي سيقوم بها الشركاء ',
                    text: controller.models[0].keyActivitiesExecutedByPartners),
                MyTable(
                    title: 'المنتجات التي يدفع عنها الجمهور',
                    text: controller.models[0].productsAudiencePaysFor),
                MyTable(
                    title: 'طرق الدفع الحالية ',
                    text: controller.models[0].currentPaymentMethods),
                MyTable(
                    title: 'طرق الدفع المفضلة ',
                    text: controller.models[0].preferredPaymentMethods),
                MyTable(
                    title: 'نسبة الإيرادات لكل منتج في المشروع ',
                    text: controller
                        .models[0].revenuePercentagePerProductForProject),
                MyTable(
                    title: 'التكاليف الرئيسية للمشروع ',
                    text: controller.models[0].majorCostsForProject),
                MyTable(
                    title: ' الموارد الأكثر تكلفة ',
                    text: controller.models[0].mostCostlyKeyResources),
                MyTable(
                    title: 'الأنشطة الأكثر تكلفة',
                    text: controller.models[0].mostCostlyKeyActivities),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
