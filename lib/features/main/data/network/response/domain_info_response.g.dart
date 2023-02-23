// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DomainInfoResponse _$DomainInfoResponseFromJson(Map<String, dynamic> json) =>
    DomainInfoResponse(
      json['status'] as String,
      json['messageCode'] as String,
      json['message'] as String,
      DomainInfoDTO.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DomainInfoResponseToJson(DomainInfoResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'messageCode': instance.messageCode,
      'message': instance.message,
      'result': instance.result.toJson(),
    };
