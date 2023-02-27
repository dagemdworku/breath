// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();

  @JsonSerializable(explicitToJson: true)
  const factory User({
    /// User id
    required String id,

    /// User first name
    @Default('') String firstName,

    /// User last name
    @Default('') String lastName,

    /// User city
    @Default('') String city,

    /// User job title
    @Default('') String jobTitle,

    /// User bio
    @Default('') String bio,

    /// User hobbies
    @Default([]) List<String> hobbies,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
