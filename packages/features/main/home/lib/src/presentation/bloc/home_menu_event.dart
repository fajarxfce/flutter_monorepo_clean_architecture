import '../../domain/model/menu_item.dart';

sealed class HomeMenuEvent {
  const HomeMenuEvent();
}

/// Initialize menus from registry
final class HomeMenuStarted extends HomeMenuEvent {
  const HomeMenuStarted();
}

/// Update badge count for a specific menu item
final class HomeMenuBadgeUpdated extends HomeMenuEvent {
  final String menuId;
  final int count;

  const HomeMenuBadgeUpdated({required this.menuId, required this.count});
}

/// Toggle dot indicator for a menu item (e.g., new feature indicator)
final class HomeMenuDotToggled extends HomeMenuEvent {
  final String menuId;
  final bool showDot;

  const HomeMenuDotToggled({required this.menuId, required this.showDot});
}

/// Toggle visibility of a menu item
final class HomeMenuVisibilityChanged extends HomeMenuEvent {
  final String menuId;
  final bool isVisible;

  const HomeMenuVisibilityChanged({
    required this.menuId,
    required this.isVisible,
  });
}

/// Toggle enabled state of a menu item
final class HomeMenuEnabledChanged extends HomeMenuEvent {
  final String menuId;
  final bool isEnabled;

  const HomeMenuEnabledChanged({
    required this.menuId,
    required this.isEnabled,
  });
}

/// Batch update multiple menu items at once
final class HomeMenuBatchUpdated extends HomeMenuEvent {
  final List<MenuItem> updatedItems;

  const HomeMenuBatchUpdated({required this.updatedItems});
}
