// To parse this JSON data, do
//
//     final evaluationCount = evaluationCountFromJson(jsonString);

import 'dart:convert';

EvaluationCountModel evaluationCountFromJson(String str) => EvaluationCountModel.fromJson(json.decode(str));

String evaluationCountToJson(EvaluationCountModel data) => json.encode(data.toJson());

class EvaluationCountModel {
  int totalEvaluationCount;
  bool isEvaluated;

  EvaluationCountModel({
    required this.totalEvaluationCount,
    this.isEvaluated = false,
  });

  factory EvaluationCountModel.fromJson(Map<String, dynamic> json) => EvaluationCountModel(
    totalEvaluationCount: json["total_evaluation_count"],
  );

  Map<String, dynamic> toJson() => {
    "total_evaluation_count": totalEvaluationCount,
  };
}
