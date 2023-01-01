// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionResponse _$SessionResponseFromJson(Map<String, dynamic> json) =>
    SessionResponse(
      json['output_ResponseCode'] as String,
      json['output_ResponseDesc'] as String,
      json['output_SessionID'] as String,
    );

Map<String, dynamic> _$SessionResponseToJson(SessionResponse instance) =>
    <String, dynamic>{
      'output_ResponseCode': instance.outputResponseCode,
      'output_ResponseDesc': instance.outputResponseDesc,
      'output_SessionID': instance.outputSessionID,
    };
