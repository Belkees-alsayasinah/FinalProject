import 'package:bloom_project/Evaluation/evaluation_service.dart';
import 'package:get/get.dart';
import '../service/info.dart';
import 'evaluation_model.dart';

class AddEvaluationController extends GetxController {
  String id;
  AddEvaluationController({required this.id});

  var models = <EvaluationCountModel>[].obs;
  var isLoad = true.obs;

  late AddEvaluationService service;

  @override
  Future<void> onInit() async {
    super.onInit();
    service = AddEvaluationService();
    await getdata(id);
  }

  Future<void> addEvaluation(String id) async {
    bool addEvaluationState = await service.addEvaluation(id);
    if (addEvaluationState) {
      await getdata(id);
    } else {
      print('error');
    }
  }

  Future<void> getdata(String id) async {
    isLoad.value = true;
    await service.getEvaluationCount(UserInformation.user_token, id);
    models.assignAll(service.model);
    isLoad.value = false;
  }
}
