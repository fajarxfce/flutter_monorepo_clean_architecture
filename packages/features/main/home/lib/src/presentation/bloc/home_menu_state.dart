import 'package:shared/shared.dart';

import '../../domain/model/menu_item.dart';

part 'home_menu_state.freezed.dart';

@freezed
abstract class HomeMenuState with _$HomeMenuState {
  const factory HomeMenuState({
    /// All menu items indexed by ID (single source of truth)
    @Default({}) Map<String, MenuItem> menuItems,

    /// IDs of menus shown on the home grid (order matters)
    @Default([]) List<String> primaryMenuIds,

    /// Menu groups for the "Lainnya" bottom sheet
    @Default([]) List<MenuGroup> menuGroups,

    /// Whether the menu data has been initialized
    @Default(false) bool isInitialized,
  }) = _HomeMenuState;
}

/// Extension for convenient access to derived data
extension HomeMenuStateX on HomeMenuState {
  /// Get the primary menu items (visible ones only) for the home grid
  List<MenuItem> get primaryMenuItems => primaryMenuIds
      .where((id) => menuItems.containsKey(id))
      .map((id) => menuItems[id]!)
      .where((item) => item.isVisible)
      .toList();

  /// Get menu groups with updated items from the reactive state
  List<MenuGroup> get reactiveMenuGroups => menuGroups
      .where((group) => group.isVisible)
      .map(
        (group) => group.copyWith(
          items: group.items
              .map((item) => menuItems[item.id] ?? item)
              .where((item) => item.isVisible)
              .toList(),
        ),
      )
      .where((group) => group.items.isNotEmpty)
      .toList();

  /// Get total badge count across all menus
  int get totalBadgeCount =>
      menuItems.values.fold(0, (sum, item) => sum + item.badgeCount);

  /// Check if any menu has a dot indicator
  bool get hasAnyDot => menuItems.values.any((item) => item.showDot);
}
