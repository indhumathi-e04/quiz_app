import 'package:json_annotation/json_annotation.dart';

import 'latest_quiz_response.dart';
part 'attempt_previous_year_questions.g.dart';

@JsonSerializable()
class AttemptPreviousYearQuestions {
  @JsonKey(name: "attempt_previous_year_questions")
  List<TestDetailsResponse>? attemptPreviousYearQuestions;
  AttemptPreviousYearQuestions({
    this.attemptPreviousYearQuestions,
  });
  factory AttemptPreviousYearQuestions.fromJson(Map<String, dynamic> json) =>
      _$AttemptPreviousYearQuestionsFromJson(json);
}
