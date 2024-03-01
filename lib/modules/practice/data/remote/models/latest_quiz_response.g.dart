// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_quiz_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatestQuizResponse _$LatestQuizResponseFromJson(Map<String, dynamic> json) =>
    LatestQuizResponse(
      latestQuizzes: (json['latest_quizzes'] as List<dynamic>?)
          ?.map((e) => TestDetailsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LatestQuizResponseToJson(LatestQuizResponse instance) =>
    <String, dynamic>{
      'latest_quizzes': instance.latestQuizzes,
    };

TestDetailsResponse _$TestDetailsResponseFromJson(Map<String, dynamic> json) =>
    TestDetailsResponse(
      testId: json['test_id'] as int?,
      testTitle: json['test_title'] as String?,
      creatorName: json['creator_name'] as String?,
      isVerified: json['is_verified'] as bool?,
      totalQuestions: json['total_questions'] as int?,
      timeLimit: json['time_limit'] as int?,
      totalMarks: (json['total_marks'] as num?)?.toDouble(),
      coins: (json['coins'] as num?)?.toDouble(),
      attemptsCount: json['attempts_count'] as int?,
      tag: json['tag'] as String?,
    );

Map<String, dynamic> _$TestDetailsResponseToJson(
        TestDetailsResponse instance) =>
    <String, dynamic>{
      'test_id': instance.testId,
      'test_title': instance.testTitle,
      'creator_name': instance.creatorName,
      'is_verified': instance.isVerified,
      'total_questions': instance.totalQuestions,
      'time_limit': instance.timeLimit,
      'total_marks': instance.totalMarks,
      'coins': instance.coins,
      'attempts_count': instance.attemptsCount,
      'tag': instance.tag,
    };
