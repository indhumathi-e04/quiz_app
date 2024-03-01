// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'continue_your_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContinueYourProgress _$ContinueYourProgressFromJson(
        Map<String, dynamic> json) =>
    ContinueYourProgress(
      continueYourProgress: (json['continue_progress'] as List<dynamic>?)
          ?.map((e) => TestDetailsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ContinueYourProgressToJson(
        ContinueYourProgress instance) =>
    <String, dynamic>{
      'continue_progress': instance.continueYourProgress,
    };
