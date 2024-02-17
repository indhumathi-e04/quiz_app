import 'subject_model.dart';

class SyllabusModel {
  int? examCategory;
  int? examName;
  int? examYear;
  String? syllabusLink;
  int? subjectsCount;
  List<SubjectModel>? subjects;

  SyllabusModel({
    this.examCategory,
    this.examName,
    this.examYear,
    this.subjectsCount,
    this.syllabusLink,
  });
}
