// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String,
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      city: json['city'] as String? ?? '',
      jobTitle: json['jobTitle'] as String? ?? '',
      bio: json['bio'] as String? ?? '',
      hobbies: (json['hobbies'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'city': instance.city,
      'jobTitle': instance.jobTitle,
      'bio': instance.bio,
      'hobbies': instance.hobbies,
    };
