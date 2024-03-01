import 'package:json_annotation/json_annotation.dart';

import '../../../domain/models/test_details_entity.dart';

part 'latest_quiz_response.g.dart';

@JsonSerializable()
class LatestQuizResponse {
  @JsonKey(name: "latest_quizzes")
  List<TestDetailsResponse>? latestQuizzes;

  LatestQuizResponse({
    this.latestQuizzes,
  });

  factory LatestQuizResponse.fromJson(Map<String, dynamic> json) =>
      _$LatestQuizResponseFromJson(json);
}

@JsonSerializable()
class TestDetailsResponse {
  @JsonKey(name: "test_id")
  int? testId;
  @JsonKey(name: "test_title")
  String? testTitle;
  @JsonKey(name: "creator_name")
  String? creatorName;
  @JsonKey(name: "is_verified")
  bool? isVerified;
  @JsonKey(name: "total_questions")
  int? totalQuestions;
  @JsonKey(name: "time_limit")
  int? timeLimit;
  @JsonKey(name: "total_marks")
  double? totalMarks;
  @JsonKey(name: "coins")
  double? coins;
  @JsonKey(name: "attempts_count")
  int? attemptsCount;
  @JsonKey(name: "tag")
  String? tag;

  TestDetailsResponse({
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

  factory TestDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$TestDetailsResponseFromJson(json);

  TestDetailsEntity toEntity() => TestDetailsEntity(
        testId: testId,
        testTitle: testTitle,
        creatorName: creatorName,
        isVerified: isVerified,
        totalQuestions: totalQuestions,
        timeLimit: timeLimit,
        totalMarks: totalMarks,
        coins: coins,
        attemptsCount: attemptsCount,
        tag: tag,
      );
}
