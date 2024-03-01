import 'package:json_annotation/json_annotation.dart';
import 'latest_quiz_response.dart';

part 'trending_mock_tests.g.dart';

@JsonSerializable()
class TrendingMockTests {
  @JsonKey(name: "trending_mock_tests")
  List<TestDetailsResponse>? trendingMockTests;
  TrendingMockTests({
    this.trendingMockTests,
  });
  factory TrendingMockTests.fromJson(Map<String, dynamic> json) =>
      _$TrendingMockTestsFromJson(json);
}
