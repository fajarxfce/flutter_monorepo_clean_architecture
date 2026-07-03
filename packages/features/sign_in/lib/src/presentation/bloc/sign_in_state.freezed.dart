// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignInState {

 SignInStatus get status; String get message; bool get rememberMe; String get savedEmail; Login? get loginData;
/// Create a copy of SignInState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignInStateCopyWith<SignInState> get copyWith => _$SignInStateCopyWithImpl<SignInState>(this as SignInState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInState&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.rememberMe, rememberMe) || other.rememberMe == rememberMe)&&(identical(other.savedEmail, savedEmail) || other.savedEmail == savedEmail)&&(identical(other.loginData, loginData) || other.loginData == loginData));
}


@override
int get hashCode => Object.hash(runtimeType,status,message,rememberMe,savedEmail,loginData);

@override
String toString() {
  return 'SignInState(status: $status, message: $message, rememberMe: $rememberMe, savedEmail: $savedEmail, loginData: $loginData)';
}


}

/// @nodoc
abstract mixin class $SignInStateCopyWith<$Res>  {
  factory $SignInStateCopyWith(SignInState value, $Res Function(SignInState) _then) = _$SignInStateCopyWithImpl;
@useResult
$Res call({
 SignInStatus status, String message, bool rememberMe, String savedEmail, Login? loginData
});




}
/// @nodoc
class _$SignInStateCopyWithImpl<$Res>
    implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._self, this._then);

  final SignInState _self;
  final $Res Function(SignInState) _then;

/// Create a copy of SignInState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? message = null,Object? rememberMe = null,Object? savedEmail = null,Object? loginData = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SignInStatus,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,rememberMe: null == rememberMe ? _self.rememberMe : rememberMe // ignore: cast_nullable_to_non_nullable
as bool,savedEmail: null == savedEmail ? _self.savedEmail : savedEmail // ignore: cast_nullable_to_non_nullable
as String,loginData: freezed == loginData ? _self.loginData : loginData // ignore: cast_nullable_to_non_nullable
as Login?,
  ));
}

}


/// Adds pattern-matching-related methods to [SignInState].
extension SignInStatePatterns on SignInState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignInState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignInState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignInState value)  $default,){
final _that = this;
switch (_that) {
case _SignInState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignInState value)?  $default,){
final _that = this;
switch (_that) {
case _SignInState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SignInStatus status,  String message,  bool rememberMe,  String savedEmail,  Login? loginData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignInState() when $default != null:
return $default(_that.status,_that.message,_that.rememberMe,_that.savedEmail,_that.loginData);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SignInStatus status,  String message,  bool rememberMe,  String savedEmail,  Login? loginData)  $default,) {final _that = this;
switch (_that) {
case _SignInState():
return $default(_that.status,_that.message,_that.rememberMe,_that.savedEmail,_that.loginData);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SignInStatus status,  String message,  bool rememberMe,  String savedEmail,  Login? loginData)?  $default,) {final _that = this;
switch (_that) {
case _SignInState() when $default != null:
return $default(_that.status,_that.message,_that.rememberMe,_that.savedEmail,_that.loginData);case _:
  return null;

}
}

}

/// @nodoc


class _SignInState implements SignInState {
  const _SignInState({this.status = SignInStatus.initial, this.message = '', this.rememberMe = false, this.savedEmail = '', this.loginData});
  

@override@JsonKey() final  SignInStatus status;
@override@JsonKey() final  String message;
@override@JsonKey() final  bool rememberMe;
@override@JsonKey() final  String savedEmail;
@override final  Login? loginData;

/// Create a copy of SignInState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignInStateCopyWith<_SignInState> get copyWith => __$SignInStateCopyWithImpl<_SignInState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignInState&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.rememberMe, rememberMe) || other.rememberMe == rememberMe)&&(identical(other.savedEmail, savedEmail) || other.savedEmail == savedEmail)&&(identical(other.loginData, loginData) || other.loginData == loginData));
}


@override
int get hashCode => Object.hash(runtimeType,status,message,rememberMe,savedEmail,loginData);

@override
String toString() {
  return 'SignInState(status: $status, message: $message, rememberMe: $rememberMe, savedEmail: $savedEmail, loginData: $loginData)';
}


}

/// @nodoc
abstract mixin class _$SignInStateCopyWith<$Res> implements $SignInStateCopyWith<$Res> {
  factory _$SignInStateCopyWith(_SignInState value, $Res Function(_SignInState) _then) = __$SignInStateCopyWithImpl;
@override @useResult
$Res call({
 SignInStatus status, String message, bool rememberMe, String savedEmail, Login? loginData
});




}
/// @nodoc
class __$SignInStateCopyWithImpl<$Res>
    implements _$SignInStateCopyWith<$Res> {
  __$SignInStateCopyWithImpl(this._self, this._then);

  final _SignInState _self;
  final $Res Function(_SignInState) _then;

/// Create a copy of SignInState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? message = null,Object? rememberMe = null,Object? savedEmail = null,Object? loginData = freezed,}) {
  return _then(_SignInState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SignInStatus,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,rememberMe: null == rememberMe ? _self.rememberMe : rememberMe // ignore: cast_nullable_to_non_nullable
as bool,savedEmail: null == savedEmail ? _self.savedEmail : savedEmail // ignore: cast_nullable_to_non_nullable
as String,loginData: freezed == loginData ? _self.loginData : loginData // ignore: cast_nullable_to_non_nullable
as Login?,
  ));
}


}

// dart format on
