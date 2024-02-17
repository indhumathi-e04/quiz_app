import 'chapter_model.dart';

class SubjectModel {
  String? subjectTitle;
  String? subjectIcon;
  int? chaptersCount;
  List<ChapterModel>? chapters;

  SubjectModel({
    this.subjectIcon,
    this.subjectTitle,
    this.chaptersCount,
    this.chapters,
  });
}
