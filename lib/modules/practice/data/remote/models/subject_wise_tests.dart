import 'package:json_annotation/json_annotation.dart';

import '../../../domain/models/test_details_entity.dart';
import 'latest_quiz_response.dart';

part 'subject_wise_tests.g.dart';

@JsonSerializable()
class SubjectWiseTests {
  @JsonKey(name: "subject_wise_tests")
  List<SubjectModelResponse>? subjectWiseTests;
  SubjectWiseTests({
    this.subjectWiseTests,
  });
  factory SubjectWiseTests.fromJson(Map<String, dynamic> json) =>
      _$SubjectWiseTestsFromJson(json);
}

@JsonSerializable()
class SubjectModelResponse {
  @JsonKey(name: "subjects")
  String? subjects;
  SubjectModelResponse({
    this.subjects,
  });

  factory SubjectModelResponse.fromJson(Map<String, dynamic> json) =>
      _$SubjectModelResponseFromJson(json);

  SubjectEntityModel toEntity() => SubjectEntityModel(
        subjects: subjects,
      );
}
