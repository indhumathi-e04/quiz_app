import 'package:get/get.dart' show RxBool, BoolExtension;

class SectionModel {
  int? sectionId;
  String? sectionTitle;
  int? questionCount;
  double? positiveMarks;
  double? negativeMarks;
  int? isSectionTimeSpecific;
  int? sectionTimeLimit;
  int? firstQuestionIndex;
  int? lastQuestionIndex;

  RxBool isTimeSpecific = false.obs;

  SectionModel({
    this.sectionId,
    this.sectionTitle,
    this.questionCount,
    this.positiveMarks,
    this.negativeMarks,
    this.isSectionTimeSpecific,
    this.sectionTimeLimit,
    this.firstQuestionIndex,
    this.lastQuestionIndex,
  });
}
