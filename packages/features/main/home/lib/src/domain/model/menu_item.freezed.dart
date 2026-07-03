// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MenuItem {

/// Unique identifier for this menu item
 String get id;/// Display label
 String get label;/// Icon to display
 IconData get icon;/// Optional icon color override
 Color? get iconColor;/// Optional background color for the icon container
 Color? get backgroundColor;/// Badge count (0 = no badge shown)
 int get badgeCount;/// Whether to show a dot indicator (e.g., for new features)
 bool get showDot;/// Whether this menu item is enabled
 bool get isEnabled;/// Whether this menu item is visible
 bool get isVisible;/// Route name to navigate to when tapped
 String? get routeName;/// Optional metadata for extensibility
 Map<String, dynamic> get metadata;
/// Create a copy of MenuItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuItemCopyWith<MenuItem> get copyWith => _$MenuItemCopyWithImpl<MenuItem>(this as MenuItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuItem&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.iconColor, iconColor) || other.iconColor == iconColor)&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor)&&(identical(other.badgeCount, badgeCount) || other.badgeCount == badgeCount)&&(identical(other.showDot, showDot) || other.showDot == showDot)&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&(identical(other.routeName, routeName) || other.routeName == routeName)&&const DeepCollectionEquality().equals(other.metadata, metadata));
}


@override
int get hashCode => Object.hash(runtimeType,id,label,icon,iconColor,backgroundColor,badgeCount,showDot,isEnabled,isVisible,routeName,const DeepCollectionEquality().hash(metadata));

@override
String toString() {
  return 'MenuItem(id: $id, label: $label, icon: $icon, iconColor: $iconColor, backgroundColor: $backgroundColor, badgeCount: $badgeCount, showDot: $showDot, isEnabled: $isEnabled, isVisible: $isVisible, routeName: $routeName, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $MenuItemCopyWith<$Res>  {
  factory $MenuItemCopyWith(MenuItem value, $Res Function(MenuItem) _then) = _$MenuItemCopyWithImpl;
@useResult
$Res call({
 String id, String label, IconData icon, Color? iconColor, Color? backgroundColor, int badgeCount, bool showDot, bool isEnabled, bool isVisible, String? routeName, Map<String, dynamic> metadata
});




}
/// @nodoc
class _$MenuItemCopyWithImpl<$Res>
    implements $MenuItemCopyWith<$Res> {
  _$MenuItemCopyWithImpl(this._self, this._then);

  final MenuItem _self;
  final $Res Function(MenuItem) _then;

/// Create a copy of MenuItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? icon = null,Object? iconColor = freezed,Object? backgroundColor = freezed,Object? badgeCount = null,Object? showDot = null,Object? isEnabled = null,Object? isVisible = null,Object? routeName = freezed,Object? metadata = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData,iconColor: freezed == iconColor ? _self.iconColor : iconColor // ignore: cast_nullable_to_non_nullable
as Color?,backgroundColor: freezed == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as Color?,badgeCount: null == badgeCount ? _self.badgeCount : badgeCount // ignore: cast_nullable_to_non_nullable
as int,showDot: null == showDot ? _self.showDot : showDot // ignore: cast_nullable_to_non_nullable
as bool,isEnabled: null == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool,isVisible: null == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as bool,routeName: freezed == routeName ? _self.routeName : routeName // ignore: cast_nullable_to_non_nullable
as String?,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [MenuItem].
extension MenuItemPatterns on MenuItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuItem value)  $default,){
final _that = this;
switch (_that) {
case _MenuItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuItem value)?  $default,){
final _that = this;
switch (_that) {
case _MenuItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String label,  IconData icon,  Color? iconColor,  Color? backgroundColor,  int badgeCount,  bool showDot,  bool isEnabled,  bool isVisible,  String? routeName,  Map<String, dynamic> metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuItem() when $default != null:
return $default(_that.id,_that.label,_that.icon,_that.iconColor,_that.backgroundColor,_that.badgeCount,_that.showDot,_that.isEnabled,_that.isVisible,_that.routeName,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String label,  IconData icon,  Color? iconColor,  Color? backgroundColor,  int badgeCount,  bool showDot,  bool isEnabled,  bool isVisible,  String? routeName,  Map<String, dynamic> metadata)  $default,) {final _that = this;
switch (_that) {
case _MenuItem():
return $default(_that.id,_that.label,_that.icon,_that.iconColor,_that.backgroundColor,_that.badgeCount,_that.showDot,_that.isEnabled,_that.isVisible,_that.routeName,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String label,  IconData icon,  Color? iconColor,  Color? backgroundColor,  int badgeCount,  bool showDot,  bool isEnabled,  bool isVisible,  String? routeName,  Map<String, dynamic> metadata)?  $default,) {final _that = this;
switch (_that) {
case _MenuItem() when $default != null:
return $default(_that.id,_that.label,_that.icon,_that.iconColor,_that.backgroundColor,_that.badgeCount,_that.showDot,_that.isEnabled,_that.isVisible,_that.routeName,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc


class _MenuItem implements MenuItem {
  const _MenuItem({required this.id, required this.label, required this.icon, this.iconColor, this.backgroundColor, this.badgeCount = 0, this.showDot = false, this.isEnabled = true, this.isVisible = true, this.routeName, final  Map<String, dynamic> metadata = const {}}): _metadata = metadata;
  

/// Unique identifier for this menu item
@override final  String id;
/// Display label
@override final  String label;
/// Icon to display
@override final  IconData icon;
/// Optional icon color override
@override final  Color? iconColor;
/// Optional background color for the icon container
@override final  Color? backgroundColor;
/// Badge count (0 = no badge shown)
@override@JsonKey() final  int badgeCount;
/// Whether to show a dot indicator (e.g., for new features)
@override@JsonKey() final  bool showDot;
/// Whether this menu item is enabled
@override@JsonKey() final  bool isEnabled;
/// Whether this menu item is visible
@override@JsonKey() final  bool isVisible;
/// Route name to navigate to when tapped
@override final  String? routeName;
/// Optional metadata for extensibility
 final  Map<String, dynamic> _metadata;
/// Optional metadata for extensibility
@override@JsonKey() Map<String, dynamic> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}


/// Create a copy of MenuItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuItemCopyWith<_MenuItem> get copyWith => __$MenuItemCopyWithImpl<_MenuItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuItem&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.iconColor, iconColor) || other.iconColor == iconColor)&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor)&&(identical(other.badgeCount, badgeCount) || other.badgeCount == badgeCount)&&(identical(other.showDot, showDot) || other.showDot == showDot)&&(identical(other.isEnabled, isEnabled) || other.isEnabled == isEnabled)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible)&&(identical(other.routeName, routeName) || other.routeName == routeName)&&const DeepCollectionEquality().equals(other._metadata, _metadata));
}


@override
int get hashCode => Object.hash(runtimeType,id,label,icon,iconColor,backgroundColor,badgeCount,showDot,isEnabled,isVisible,routeName,const DeepCollectionEquality().hash(_metadata));

@override
String toString() {
  return 'MenuItem(id: $id, label: $label, icon: $icon, iconColor: $iconColor, backgroundColor: $backgroundColor, badgeCount: $badgeCount, showDot: $showDot, isEnabled: $isEnabled, isVisible: $isVisible, routeName: $routeName, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$MenuItemCopyWith<$Res> implements $MenuItemCopyWith<$Res> {
  factory _$MenuItemCopyWith(_MenuItem value, $Res Function(_MenuItem) _then) = __$MenuItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String label, IconData icon, Color? iconColor, Color? backgroundColor, int badgeCount, bool showDot, bool isEnabled, bool isVisible, String? routeName, Map<String, dynamic> metadata
});




}
/// @nodoc
class __$MenuItemCopyWithImpl<$Res>
    implements _$MenuItemCopyWith<$Res> {
  __$MenuItemCopyWithImpl(this._self, this._then);

  final _MenuItem _self;
  final $Res Function(_MenuItem) _then;

/// Create a copy of MenuItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? icon = null,Object? iconColor = freezed,Object? backgroundColor = freezed,Object? badgeCount = null,Object? showDot = null,Object? isEnabled = null,Object? isVisible = null,Object? routeName = freezed,Object? metadata = null,}) {
  return _then(_MenuItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData,iconColor: freezed == iconColor ? _self.iconColor : iconColor // ignore: cast_nullable_to_non_nullable
as Color?,backgroundColor: freezed == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as Color?,badgeCount: null == badgeCount ? _self.badgeCount : badgeCount // ignore: cast_nullable_to_non_nullable
as int,showDot: null == showDot ? _self.showDot : showDot // ignore: cast_nullable_to_non_nullable
as bool,isEnabled: null == isEnabled ? _self.isEnabled : isEnabled // ignore: cast_nullable_to_non_nullable
as bool,isVisible: null == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as bool,routeName: freezed == routeName ? _self.routeName : routeName // ignore: cast_nullable_to_non_nullable
as String?,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc
mixin _$MenuGroup {

/// Unique identifier for this group
 String get id;/// Display title for the group header
 String get title;/// Menu items in this group
 List<MenuItem> get items;/// Sort order for display
 int get order;/// Whether this group is visible
 bool get isVisible;
/// Create a copy of MenuGroup
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuGroupCopyWith<MenuGroup> get copyWith => _$MenuGroupCopyWithImpl<MenuGroup>(this as MenuGroup, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuGroup&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.order, order) || other.order == order)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,const DeepCollectionEquality().hash(items),order,isVisible);

@override
String toString() {
  return 'MenuGroup(id: $id, title: $title, items: $items, order: $order, isVisible: $isVisible)';
}


}

/// @nodoc
abstract mixin class $MenuGroupCopyWith<$Res>  {
  factory $MenuGroupCopyWith(MenuGroup value, $Res Function(MenuGroup) _then) = _$MenuGroupCopyWithImpl;
@useResult
$Res call({
 String id, String title, List<MenuItem> items, int order, bool isVisible
});




}
/// @nodoc
class _$MenuGroupCopyWithImpl<$Res>
    implements $MenuGroupCopyWith<$Res> {
  _$MenuGroupCopyWithImpl(this._self, this._then);

  final MenuGroup _self;
  final $Res Function(MenuGroup) _then;

/// Create a copy of MenuGroup
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? items = null,Object? order = null,Object? isVisible = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<MenuItem>,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,isVisible: null == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MenuGroup].
extension MenuGroupPatterns on MenuGroup {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuGroup value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuGroup() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuGroup value)  $default,){
final _that = this;
switch (_that) {
case _MenuGroup():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuGroup value)?  $default,){
final _that = this;
switch (_that) {
case _MenuGroup() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  List<MenuItem> items,  int order,  bool isVisible)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuGroup() when $default != null:
return $default(_that.id,_that.title,_that.items,_that.order,_that.isVisible);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  List<MenuItem> items,  int order,  bool isVisible)  $default,) {final _that = this;
switch (_that) {
case _MenuGroup():
return $default(_that.id,_that.title,_that.items,_that.order,_that.isVisible);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  List<MenuItem> items,  int order,  bool isVisible)?  $default,) {final _that = this;
switch (_that) {
case _MenuGroup() when $default != null:
return $default(_that.id,_that.title,_that.items,_that.order,_that.isVisible);case _:
  return null;

}
}

}

/// @nodoc


class _MenuGroup implements MenuGroup {
  const _MenuGroup({required this.id, required this.title, final  List<MenuItem> items = const [], this.order = 0, this.isVisible = true}): _items = items;
  

/// Unique identifier for this group
@override final  String id;
/// Display title for the group header
@override final  String title;
/// Menu items in this group
 final  List<MenuItem> _items;
/// Menu items in this group
@override@JsonKey() List<MenuItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

/// Sort order for display
@override@JsonKey() final  int order;
/// Whether this group is visible
@override@JsonKey() final  bool isVisible;

/// Create a copy of MenuGroup
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuGroupCopyWith<_MenuGroup> get copyWith => __$MenuGroupCopyWithImpl<_MenuGroup>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuGroup&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.order, order) || other.order == order)&&(identical(other.isVisible, isVisible) || other.isVisible == isVisible));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,const DeepCollectionEquality().hash(_items),order,isVisible);

@override
String toString() {
  return 'MenuGroup(id: $id, title: $title, items: $items, order: $order, isVisible: $isVisible)';
}


}

/// @nodoc
abstract mixin class _$MenuGroupCopyWith<$Res> implements $MenuGroupCopyWith<$Res> {
  factory _$MenuGroupCopyWith(_MenuGroup value, $Res Function(_MenuGroup) _then) = __$MenuGroupCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, List<MenuItem> items, int order, bool isVisible
});




}
/// @nodoc
class __$MenuGroupCopyWithImpl<$Res>
    implements _$MenuGroupCopyWith<$Res> {
  __$MenuGroupCopyWithImpl(this._self, this._then);

  final _MenuGroup _self;
  final $Res Function(_MenuGroup) _then;

/// Create a copy of MenuGroup
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? items = null,Object? order = null,Object? isVisible = null,}) {
  return _then(_MenuGroup(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<MenuItem>,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,isVisible: null == isVisible ? _self.isVisible : isVisible // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
