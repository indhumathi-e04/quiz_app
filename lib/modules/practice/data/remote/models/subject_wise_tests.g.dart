// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_wise_tests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectWiseTests _$SubjectWiseTestsFromJson(Map<String, dynamic> json) =>
    SubjectWiseTests(
      subjectWiseTests: (json['subject_wise_tests'] as List<dynamic>?)
          ?.map((e) => SubjectModelResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubjectWiseTestsToJson(SubjectWiseTests instance) =>
    <String, dynamic>{
      'subject_wise_tests': instance.subjectWiseTests,
    };

SubjectModelResponse _$SubjectModelResponseFromJson(
        Map<String, dynamic> json) =>
    SubjectModelResponse()..subjects = json['subjects'] as String?;

Map<String, dynamic> _$SubjectModelResponseToJson(
        SubjectModelResponse instance) =>
    <String, dynamic>{
      'subjects': instance.subjects,
    };
