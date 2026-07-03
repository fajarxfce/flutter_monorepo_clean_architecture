import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

part 'menu_item.freezed.dart';

/// Represents a single menu item in the home page.
///
/// Designed to be reactive - supports badge counts, visibility toggling,
/// and custom metadata for future extensibility.
@freezed
abstract class MenuItem with _$MenuItem {
  const factory MenuItem({
    /// Unique identifier for this menu item
    required String id,

    /// Display label
    required String label,

    /// Icon to display
    required IconData icon,

    /// Optional icon color override
    Color? iconColor,

    /// Optional background color for the icon container
    Color? backgroundColor,

    /// Badge count (0 = no badge shown)
    @Default(0) int badgeCount,

    /// Whether to show a dot indicator (e.g., for new features)
    @Default(false) bool showDot,

    /// Whether this menu item is enabled
    @Default(true) bool isEnabled,

    /// Whether this menu item is visible
    @Default(true) bool isVisible,

    /// Route name to navigate to when tapped
    String? routeName,

    /// Optional metadata for extensibility
    @Default({}) Map<String, dynamic> metadata,
  }) = _MenuItem;
}

/// Represents a group of menu items (used in the "Lainnya" bottom sheet).
@freezed
abstract class MenuGroup with _$MenuGroup {
  const factory MenuGroup({
    /// Unique identifier for this group
    required String id,

    /// Display title for the group header
    required String title,

    /// Menu items in this group
    @Default([]) List<MenuItem> items,

    /// Sort order for display
    @Default(0) int order,

    /// Whether this group is visible
    @Default(true) bool isVisible,
  }) = _MenuGroup;
}
