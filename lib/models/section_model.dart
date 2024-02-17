import 'package:get/get.dart' show RxBool, BoolExtension;
import 'package:quiz/models/question_model.dart';

class SectionModel {
  int? sectionId;
  String? sectionTitle;
  int? questionCount;
  double? positiveMarks;
  double? negativeMarks;
  int? isSectionTimeSpecific;
  int? sectionTimeLimit;
  List<QuestionModel>? questions;

  RxBool isExpanded = false.obs;
  RxBool isTimeSpecific = false.obs;

  SectionModel({
    this.sectionId,
    this.sectionTitle,
    this.questionCount,
    this.positiveMarks,
    this.negativeMarks,
    this.isSectionTimeSpecific,
    this.sectionTimeLimit,
    this.questions,
  });
}
