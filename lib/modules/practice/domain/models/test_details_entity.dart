class TestDetailsEntity {
  int? testId;
  String? testTitle;
  String? creatorName;
  bool? isVerified;
  int? totalQuestions;
  int? timeLimit;
  double? totalMarks;
  double? coins;
  int? attemptsCount;
  String? tag;

  TestDetailsEntity({
    this.testId,
    this.testTitle,
    this.creatorName,
    this.isVerified,
    this.totalQuestions,
    this.timeLimit,
    this.totalMarks,
    this.coins,
    this.attemptsCount,
    this.tag,
  });
}

class SubjectEntityModel {
  String? subjects;
  SubjectEntityModel({
    this.subjects,
  });
}
