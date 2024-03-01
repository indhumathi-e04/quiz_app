// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_quiz_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatestQuizResponse _$LatestQuizResponseFromJson(Map<String, dynamic> json) =>
    LatestQuizResponse(
      latestQuizzes: json['latest_quizzes'],
    );

Map<String, dynamic> _$LatestQuizResponseToJson(LatestQuizResponse instance) =>
    <String, dynamic>{
      'latest_quizzes': instance.latestQuizzes,
    };

TestDetailsResponse _$TestDetailsResponseFromJson(Map<String, dynamic> json) =>
    TestDetailsResponse(
      testId: json['test_id'],
      testTitle: json['test_title'],
      creatorName: json['creator_name'],
      isVerified: json['is_verified'],
      totalQuestions: json['total_questions'],
      timeLimit: json['time_limit'],
      totalMarks: json['total_marks'],
      coins: json['coins'],
      attemptsCount: json['attempts_count'],
      tag: json['tag'],
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
