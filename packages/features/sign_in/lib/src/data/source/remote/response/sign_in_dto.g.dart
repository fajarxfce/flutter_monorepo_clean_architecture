// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInDto _$SignInDtoFromJson(Map<String, dynamic> json) =>
    SignInDto(token: json['token'] as String, userId: json['userId'] as String);

Map<String, dynamic> _$SignInDtoToJson(SignInDto instance) => <String, dynamic>{
  'token': instance.token,
  'userId': instance.userId,
};
