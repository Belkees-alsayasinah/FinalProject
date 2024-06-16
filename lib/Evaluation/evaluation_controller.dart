import 'package:bloom_project/Evaluation/evaluation_service.dart';
import 'package:get/get.dart';
import '../service/info.dart';
import 'evaluation_model.dart';

class AddEvaluationController extends GetxController {
  String id;

  AddEvaluationController({required this.id});

  late String content;
  late bool state;
  late String message;
  late AddEvaluationService service;
  late bool addEvaluationState;
  var models = <EvaluationCountModel>[].obs;
  var isLoad = true.obs;
  var d;
  late String update1;

  @override
  Future<void> onInit() async {
    update1 = '';
    content = '';
    message = '';
    addEvaluationState = false;
    service = AddEvaluationService();
    await getdata(id);
    super.onInit();
  }

  Future<void> addEvaluation(String id) async {
    addEvaluationState = await service.addEvaluation(id);
    if (addEvaluationState) {
      await getdata(id);
    } else {
      print('error');
    }
  }

  Future<void> getdata(String id) async {
    isLoad.value = true;
    d = await service.getEvaluationCount(UserInformation.user_token, id);
    models.assignAll(service.model);
    isLoad.value = false;
    update();
    if (models.isEmpty) {
    } else if (models[0].totalEvaluationCount.toString() == "null") {}
  }
}
