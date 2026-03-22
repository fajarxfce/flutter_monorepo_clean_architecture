// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:main/src/presentation/page/dummy_detail_page.dart' as _i1;
import 'package:main/src/presentation/page/dummy_history_page.dart' as _i2;
import 'package:main/src/presentation/page/dummy_inventory_page.dart' as _i3;
import 'package:main/src/presentation/page/main_page.dart' as _i4;

/// generated route for
/// [_i1.DummyDetailPage]
class DummyDetailRoute extends _i5.PageRouteInfo<DummyDetailRouteArgs> {
  DummyDetailRoute({
    _i6.Key? key,
    required String id,
    List<_i5.PageRouteInfo>? children,
  }) : super(
         DummyDetailRoute.name,
         args: DummyDetailRouteArgs(key: key, id: id),
         rawPathParams: {'id': id},
         initialChildren: children,
       );

  static const String name = 'DummyDetailRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<DummyDetailRouteArgs>(
        orElse: () => DummyDetailRouteArgs(id: pathParams.getString('id')),
      );
      return _i1.DummyDetailPage(key: args.key, id: args.id);
    },
  );
}

class DummyDetailRouteArgs {
  const DummyDetailRouteArgs({this.key, required this.id});

  final _i6.Key? key;

  final String id;

  @override
  String toString() {
    return 'DummyDetailRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DummyDetailRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [_i2.DummyHistoryPage]
class DummyHistoryRoute extends _i5.PageRouteInfo<void> {
  const DummyHistoryRoute({List<_i5.PageRouteInfo>? children})
    : super(DummyHistoryRoute.name, initialChildren: children);

  static const String name = 'DummyHistoryRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.DummyHistoryPage();
    },
  );
}

/// generated route for
/// [_i3.DummyInventoryPage]
class DummyInventoryRoute extends _i5.PageRouteInfo<void> {
  const DummyInventoryRoute({List<_i5.PageRouteInfo>? children})
    : super(DummyInventoryRoute.name, initialChildren: children);

  static const String name = 'DummyInventoryRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.DummyInventoryPage();
    },
  );
}

/// generated route for
/// [_i4.MainPage]
class MainRoute extends _i5.PageRouteInfo<void> {
  const MainRoute({List<_i5.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.MainPage();
    },
  );
}
