import 'section_model.dart';

class TestModel {
  int? testId;
  int? examCategory;
  int? examName;
  int? testType;
  int? contentType;
  int? subject;
  int? chapter;
  int? language;
  String? testTitle;
  int? timeLimit;
  int? sectionsCount;
  String? instructions;
  List<SectionModel>? sections;

  TestModel({
    this.testId,
    this.examCategory,
    this.examName,
    this.testType,
    this.contentType,
    this.subject,
    this.chapter,
    this.language,
    this.testTitle,
    this.timeLimit,
    this.sectionsCount,
    this.instructions,
    this.sections,
  });
}
