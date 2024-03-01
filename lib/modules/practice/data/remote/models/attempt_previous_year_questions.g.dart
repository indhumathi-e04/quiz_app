// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attempt_previous_year_questions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttemptPreviousYearQuestions _$AttemptPreviousYearQuestionsFromJson(
        Map<String, dynamic> json) =>
    AttemptPreviousYearQuestions(
      attemptPreviousYearQuestions: (json['attempt_previous_year_questions']
              as List<dynamic>?)
          ?.map((e) => TestDetailsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AttemptPreviousYearQuestionsToJson(
        AttemptPreviousYearQuestions instance) =>
    <String, dynamic>{
      'attempt_previous_year_questions': instance.attemptPreviousYearQuestions,
    };
