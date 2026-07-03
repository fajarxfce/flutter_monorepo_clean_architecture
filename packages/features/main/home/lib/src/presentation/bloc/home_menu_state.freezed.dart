// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_menu_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeMenuState {

/// All menu items indexed by ID (single source of truth)
 Map<String, MenuItem> get menuItems;/// IDs of menus shown on the home grid (order matters)
 List<String> get primaryMenuIds;/// Menu groups for the "Lainnya" bottom sheet
 List<MenuGroup> get menuGroups;/// Whether the menu data has been initialized
 bool get isInitialized;
/// Create a copy of HomeMenuState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeMenuStateCopyWith<HomeMenuState> get copyWith => _$HomeMenuStateCopyWithImpl<HomeMenuState>(this as HomeMenuState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeMenuState&&const DeepCollectionEquality().equals(other.menuItems, menuItems)&&const DeepCollectionEquality().equals(other.primaryMenuIds, primaryMenuIds)&&const DeepCollectionEquality().equals(other.menuGroups, menuGroups)&&(identical(other.isInitialized, isInitialized) || other.isInitialized == isInitialized));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(menuItems),const DeepCollectionEquality().hash(primaryMenuIds),const DeepCollectionEquality().hash(menuGroups),isInitialized);

@override
String toString() {
  return 'HomeMenuState(menuItems: $menuItems, primaryMenuIds: $primaryMenuIds, menuGroups: $menuGroups, isInitialized: $isInitialized)';
}


}

/// @nodoc
abstract mixin class $HomeMenuStateCopyWith<$Res>  {
  factory $HomeMenuStateCopyWith(HomeMenuState value, $Res Function(HomeMenuState) _then) = _$HomeMenuStateCopyWithImpl;
@useResult
$Res call({
 Map<String, MenuItem> menuItems, List<String> primaryMenuIds, List<MenuGroup> menuGroups, bool isInitialized
});




}
/// @nodoc
class _$HomeMenuStateCopyWithImpl<$Res>
    implements $HomeMenuStateCopyWith<$Res> {
  _$HomeMenuStateCopyWithImpl(this._self, this._then);

  final HomeMenuState _self;
  final $Res Function(HomeMenuState) _then;

/// Create a copy of HomeMenuState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? menuItems = null,Object? primaryMenuIds = null,Object? menuGroups = null,Object? isInitialized = null,}) {
  return _then(_self.copyWith(
menuItems: null == menuItems ? _self.menuItems : menuItems // ignore: cast_nullable_to_non_nullable
as Map<String, MenuItem>,primaryMenuIds: null == primaryMenuIds ? _self.primaryMenuIds : primaryMenuIds // ignore: cast_nullable_to_non_nullable
as List<String>,menuGroups: null == menuGroups ? _self.menuGroups : menuGroups // ignore: cast_nullable_to_non_nullable
as List<MenuGroup>,isInitialized: null == isInitialized ? _self.isInitialized : isInitialized // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeMenuState].
extension HomeMenuStatePatterns on HomeMenuState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeMenuState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeMenuState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeMenuState value)  $default,){
final _that = this;
switch (_that) {
case _HomeMenuState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeMenuState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeMenuState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, MenuItem> menuItems,  List<String> primaryMenuIds,  List<MenuGroup> menuGroups,  bool isInitialized)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeMenuState() when $default != null:
return $default(_that.menuItems,_that.primaryMenuIds,_that.menuGroups,_that.isInitialized);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, MenuItem> menuItems,  List<String> primaryMenuIds,  List<MenuGroup> menuGroups,  bool isInitialized)  $default,) {final _that = this;
switch (_that) {
case _HomeMenuState():
return $default(_that.menuItems,_that.primaryMenuIds,_that.menuGroups,_that.isInitialized);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, MenuItem> menuItems,  List<String> primaryMenuIds,  List<MenuGroup> menuGroups,  bool isInitialized)?  $default,) {final _that = this;
switch (_that) {
case _HomeMenuState() when $default != null:
return $default(_that.menuItems,_that.primaryMenuIds,_that.menuGroups,_that.isInitialized);case _:
  return null;

}
}

}

/// @nodoc


class _HomeMenuState implements HomeMenuState {
  const _HomeMenuState({final  Map<String, MenuItem> menuItems = const {}, final  List<String> primaryMenuIds = const [], final  List<MenuGroup> menuGroups = const [], this.isInitialized = false}): _menuItems = menuItems,_primaryMenuIds = primaryMenuIds,_menuGroups = menuGroups;
  

/// All menu items indexed by ID (single source of truth)
 final  Map<String, MenuItem> _menuItems;
/// All menu items indexed by ID (single source of truth)
@override@JsonKey() Map<String, MenuItem> get menuItems {
  if (_menuItems is EqualUnmodifiableMapView) return _menuItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_menuItems);
}

/// IDs of menus shown on the home grid (order matters)
 final  List<String> _primaryMenuIds;
/// IDs of menus shown on the home grid (order matters)
@override@JsonKey() List<String> get primaryMenuIds {
  if (_primaryMenuIds is EqualUnmodifiableListView) return _primaryMenuIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_primaryMenuIds);
}

/// Menu groups for the "Lainnya" bottom sheet
 final  List<MenuGroup> _menuGroups;
/// Menu groups for the "Lainnya" bottom sheet
@override@JsonKey() List<MenuGroup> get menuGroups {
  if (_menuGroups is EqualUnmodifiableListView) return _menuGroups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_menuGroups);
}

/// Whether the menu data has been initialized
@override@JsonKey() final  bool isInitialized;

/// Create a copy of HomeMenuState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeMenuStateCopyWith<_HomeMenuState> get copyWith => __$HomeMenuStateCopyWithImpl<_HomeMenuState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeMenuState&&const DeepCollectionEquality().equals(other._menuItems, _menuItems)&&const DeepCollectionEquality().equals(other._primaryMenuIds, _primaryMenuIds)&&const DeepCollectionEquality().equals(other._menuGroups, _menuGroups)&&(identical(other.isInitialized, isInitialized) || other.isInitialized == isInitialized));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_menuItems),const DeepCollectionEquality().hash(_primaryMenuIds),const DeepCollectionEquality().hash(_menuGroups),isInitialized);

@override
String toString() {
  return 'HomeMenuState(menuItems: $menuItems, primaryMenuIds: $primaryMenuIds, menuGroups: $menuGroups, isInitialized: $isInitialized)';
}


}

/// @nodoc
abstract mixin class _$HomeMenuStateCopyWith<$Res> implements $HomeMenuStateCopyWith<$Res> {
  factory _$HomeMenuStateCopyWith(_HomeMenuState value, $Res Function(_HomeMenuState) _then) = __$HomeMenuStateCopyWithImpl;
@override @useResult
$Res call({
 Map<String, MenuItem> menuItems, List<String> primaryMenuIds, List<MenuGroup> menuGroups, bool isInitialized
});




}
/// @nodoc
class __$HomeMenuStateCopyWithImpl<$Res>
    implements _$HomeMenuStateCopyWith<$Res> {
  __$HomeMenuStateCopyWithImpl(this._self, this._then);

  final _HomeMenuState _self;
  final $Res Function(_HomeMenuState) _then;

/// Create a copy of HomeMenuState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? menuItems = null,Object? primaryMenuIds = null,Object? menuGroups = null,Object? isInitialized = null,}) {
  return _then(_HomeMenuState(
menuItems: null == menuItems ? _self._menuItems : menuItems // ignore: cast_nullable_to_non_nullable
as Map<String, MenuItem>,primaryMenuIds: null == primaryMenuIds ? _self._primaryMenuIds : primaryMenuIds // ignore: cast_nullable_to_non_nullable
as List<String>,menuGroups: null == menuGroups ? _self._menuGroups : menuGroups // ignore: cast_nullable_to_non_nullable
as List<MenuGroup>,isInitialized: null == isInitialized ? _self.isInitialized : isInitialized // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
