class SectionsModel {
  String? sectionTitle;
  int? questionCount;
  double? positiveMarks;
  double? negativeMarks;
  int? isSectionTimeSpecific;
  int? sectionTimeLimit;

  SectionsModel({
    this.sectionTitle,
    this.questionCount,
    this.positiveMarks,
    this.negativeMarks,
    this.isSectionTimeSpecific,
    this.sectionTimeLimit,
  });

  @override
  String toString() {
    return "$sectionTitle - $questionCount";
  }
}
