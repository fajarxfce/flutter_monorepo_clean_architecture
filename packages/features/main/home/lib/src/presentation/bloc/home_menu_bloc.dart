import 'package:shared/shared.dart';

import '../../domain/model/menu_item.dart';
import '../../domain/model/menu_registry.dart';
import 'home_menu_event.dart';
import 'home_menu_state.dart';

@injectable
class HomeMenuBloc extends Bloc<HomeMenuEvent, HomeMenuState> {
  HomeMenuBloc() : super(const HomeMenuState()) {
    on<HomeMenuStarted>(_onStarted);
    on<HomeMenuBadgeUpdated>(_onBadgeUpdated);
    on<HomeMenuDotToggled>(_onDotToggled);
    on<HomeMenuVisibilityChanged>(_onVisibilityChanged);
    on<HomeMenuEnabledChanged>(_onEnabledChanged);
    on<HomeMenuBatchUpdated>(_onBatchUpdated);
  }

  void _onStarted(HomeMenuStarted event, Emitter<HomeMenuState> emit) {
    emit(
      state.copyWith(
        menuItems: Map.from(MenuRegistry.allMenus),
        primaryMenuIds: MenuRegistry.primaryMenuIds,
        menuGroups: MenuRegistry.menuGroups,
        isInitialized: true,
      ),
    );
  }

  void _onBadgeUpdated(
    HomeMenuBadgeUpdated event,
    Emitter<HomeMenuState> emit,
  ) {
    final item = state.menuItems[event.menuId];
    if (item == null) return;

    final updated = Map<String, MenuItem>.from(state.menuItems);
    updated[event.menuId] = item.copyWith(badgeCount: event.count);
    emit(state.copyWith(menuItems: updated));
  }

  void _onDotToggled(
    HomeMenuDotToggled event,
    Emitter<HomeMenuState> emit,
  ) {
    final item = state.menuItems[event.menuId];
    if (item == null) return;

    final updated = Map<String, MenuItem>.from(state.menuItems);
    updated[event.menuId] = item.copyWith(showDot: event.showDot);
    emit(state.copyWith(menuItems: updated));
  }

  void _onVisibilityChanged(
    HomeMenuVisibilityChanged event,
    Emitter<HomeMenuState> emit,
  ) {
    final item = state.menuItems[event.menuId];
    if (item == null) return;

    final updated = Map<String, MenuItem>.from(state.menuItems);
    updated[event.menuId] = item.copyWith(isVisible: event.isVisible);
    emit(state.copyWith(menuItems: updated));
  }

  void _onEnabledChanged(
    HomeMenuEnabledChanged event,
    Emitter<HomeMenuState> emit,
  ) {
    final item = state.menuItems[event.menuId];
    if (item == null) return;

    final updated = Map<String, MenuItem>.from(state.menuItems);
    updated[event.menuId] = item.copyWith(isEnabled: event.isEnabled);
    emit(state.copyWith(menuItems: updated));
  }

  void _onBatchUpdated(
    HomeMenuBatchUpdated event,
    Emitter<HomeMenuState> emit,
  ) {
    final updated = Map<String, MenuItem>.from(state.menuItems);
    for (final item in event.updatedItems) {
      updated[item.id] = item;
    }
    emit(state.copyWith(menuItems: updated));
  }
}
