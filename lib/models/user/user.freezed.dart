// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  /// User id
  String get id => throw _privateConstructorUsedError;

  /// First name of the user
  String get firstName => throw _privateConstructorUsedError;

  /// Last name of the user
  String get lastName => throw _privateConstructorUsedError;

  /// bio of the user
  String get city => throw _privateConstructorUsedError;

  /// bio of the user
  String get jobTitle => throw _privateConstructorUsedError;

  /// bio of the user
  String get bio => throw _privateConstructorUsedError;

  /// List of roles of the user
  List<String> get hobbies => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String id,
      String firstName,
      String lastName,
      String city,
      String jobTitle,
      String bio,
      List<String> hobbies});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? city = null,
    Object? jobTitle = null,
    Object? bio = null,
    Object? hobbies = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      jobTitle: null == jobTitle
          ? _value.jobTitle
          : jobTitle // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      hobbies: null == hobbies
          ? _value.hobbies
          : hobbies // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String firstName,
      String lastName,
      String city,
      String jobTitle,
      String bio,
      List<String> hobbies});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? city = null,
    Object? jobTitle = null,
    Object? bio = null,
    Object? hobbies = null,
  }) {
    return _then(_$_User(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      jobTitle: null == jobTitle
          ? _value.jobTitle
          : jobTitle // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      hobbies: null == hobbies
          ? _value._hobbies
          : hobbies // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_User extends _User {
  const _$_User(
      {required this.id,
      this.firstName = '',
      this.lastName = '',
      this.city = '',
      this.jobTitle = '',
      this.bio = '',
      final List<String> hobbies = const []})
      : _hobbies = hobbies,
        super._();

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  /// User id
  @override
  final String id;

  /// First name of the user
  @override
  @JsonKey()
  final String firstName;

  /// Last name of the user
  @override
  @JsonKey()
  final String lastName;

  /// bio of the user
  @override
  @JsonKey()
  final String city;

  /// bio of the user
  @override
  @JsonKey()
  final String jobTitle;

  /// bio of the user
  @override
  @JsonKey()
  final String bio;

  /// List of roles of the user
  final List<String> _hobbies;

  /// List of roles of the user
  @override
  @JsonKey()
  List<String> get hobbies {
    if (_hobbies is EqualUnmodifiableListView) return _hobbies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hobbies);
  }

  @override
  String toString() {
    return 'User(id: $id, firstName: $firstName, lastName: $lastName, city: $city, jobTitle: $jobTitle, bio: $bio, hobbies: $hobbies)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.jobTitle, jobTitle) ||
                other.jobTitle == jobTitle) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            const DeepCollectionEquality().equals(other._hobbies, _hobbies));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName, city,
      jobTitle, bio, const DeepCollectionEquality().hash(_hobbies));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User extends User {
  const factory _User(
      {required final String id,
      final String firstName,
      final String lastName,
      final String city,
      final String jobTitle,
      final String bio,
      final List<String> hobbies}) = _$_User;
  const _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override

  /// User id
  String get id;
  @override

  /// First name of the user
  String get firstName;
  @override

  /// Last name of the user
  String get lastName;
  @override

  /// bio of the user
  String get city;
  @override

  /// bio of the user
  String get jobTitle;
  @override

  /// bio of the user
  String get bio;
  @override

  /// List of roles of the user
  List<String> get hobbies;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
