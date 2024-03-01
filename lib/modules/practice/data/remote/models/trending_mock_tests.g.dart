// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_mock_tests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendingMockTests _$TrendingMockTestsFromJson(Map<String, dynamic> json) =>
    TrendingMockTests(
      trendingMockTests: (json['trending_mock_tests'] as List<dynamic>?)
          ?.map((e) => TestDetailsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TrendingMockTestsToJson(TrendingMockTests instance) =>
    <String, dynamic>{
      'trending_mock_tests': instance.trendingMockTests,
    };
