import 'package:get/get.dart';

class SectionsModel {
  String? sectionTitle;
  int? questionCount;
  double? positiveMarks;
  double? negativeMarks;
  int? isSectionTimeSpecific;
  int? sectionTimeLimit;

  RxBool isExpanded = false.obs;
  RxnInt isTimeSpecific = RxnInt();

  SectionsModel({
    this.sectionTitle,
    this.questionCount,
    this.positiveMarks,
    this.negativeMarks,
    this.isSectionTimeSpecific,
    this.sectionTimeLimit,
  });

  get sectionsModelList => null;

  @override
  String toString() {
    return "$sectionTitle - $questionCount";
  }
}
