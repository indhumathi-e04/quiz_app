import 'package:json_annotation/json_annotation.dart';

import 'latest_quiz_response.dart';
part "continue_your_progress.g.dart";

@JsonSerializable()
class ContinueYourProgress {
  @JsonKey(name: "continue_progress")
  List<TestDetailsResponse>? continueYourProgress;
  ContinueYourProgress({
    this.continueYourProgress,
  });

  factory ContinueYourProgress.fromJson(Map<String, dynamic> json) =>
      _$ContinueYourProgressFromJson(json);
}
