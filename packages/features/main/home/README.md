# Home Menu Feature

Fitur menu dinamis dan reaktif untuk home page dengan support badge, dot indicator, dan grouping.

## Struktur

```
home/
├── lib/
│   ├── di/                          # Dependency Injection
│   │   ├── di.dart
│   │   └── di.module.dart (generated)
│   ├── src/
│   │   ├── domain/
│   │   │   └── model/
│   │   │       ├── menu_item.dart           # Model MenuItem & MenuGroup (Freezed)
│   │   │       ├── menu_item.freezed.dart   # Generated
│   │   │       └── menu_registry.dart       # Registry semua menu
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── home_menu_bloc.dart      # BLoC untuk state management
│   │       │   ├── home_menu_event.dart     # Events
│   │       │   ├── home_menu_state.dart     # State (Freezed)
│   │       │   └── home_menu_state.freezed.dart
│   │       ├── page/
│   │       │   └── home_page.dart           # Home page
│   │       └── widget/
│   │           ├── menu_grid.dart           # Grid menu utama
│   │           ├── menu_item_card.dart      # Card per menu item
│   │           └── menu_bottom_sheet.dart   # Bottom sheet "Lainnya"
│   └── home.dart                    # Barrel export
```

## Cara Menambah Menu Baru

### 1. Tambahkan ID di `MenuIds`

```dart
// lib/src/domain/model/menu_registry.dart
abstract class MenuIds {
  static const String menuBaru = 'menu_baru';
}
```

### 2. Definisikan MenuItem di `MenuRegistry.allMenus`

```dart
MenuIds.menuBaru: MenuItem(
  id: MenuIds.menuBaru,
  label: 'Menu Baru',
  icon: Icons.new_releases_rounded,
  iconColor: Colors.white,
  backgroundColor: const Color(0xFF10B981),
),
```

### 3. Assign ke Group atau Primary Menu

**Untuk menu utama (home grid):**
```dart
static const List<String> primaryMenuIds = [
  MenuIds.kasir,
  MenuIds.produk,
  // ... existing menus
  MenuIds.menuBaru,  // Tambahkan di sini
];
```

**Untuk menu di bottom sheet:**
```dart
MenuGroup(
  id: 'group_id',
  title: 'Nama Group',
  order: 0,
  items: _resolveItems([
    MenuIds.existingMenu,
    MenuIds.menuBaru,  // Tambahkan di sini
  ]),
),
```

## Cara Update Badge/Dot Secara Dinamis

### Update Badge Count

```dart
// Di mana saja yang punya akses ke HomeMenuBloc
bloc.add(HomeMenuBadgeUpdated(menuId: MenuIds.pesanan, count: 5));
```

### Toggle Dot Indicator

```dart
bloc.add(HomeMenuDotToggled(menuId: MenuIds.promo, showDot: true));
```

### Toggle Visibility

```dart
bloc.add(HomeMenuVisibilityChanged(menuId: MenuIds.menuBaru, isVisible: false));
```

### Toggle Enabled State

```dart
bloc.add(HomeMenuEnabledChanged(menuId: MenuIds.menuBaru, isEnabled: false));
```

### Batch Update

```dart
bloc.add(HomeMenuBatchUpdated(
  updatedItems: [
    menuItem1.copyWith(badgeCount: 3),
    menuItem2.copyWith(showDot: true),
  ],
));
```

## Fitur MenuItem

- **id**: Unique identifier
- **label**: Nama menu yang ditampilkan
- **icon**: IconData dari Material Icons
- **iconColor**: Warna icon (default: white)
- **backgroundColor**: Warna background icon container
- **badgeCount**: Jumlah badge (0 = tidak tampil)
- **showDot**: Dot indicator untuk fitur baru
- **isEnabled**: Menu bisa diklik atau tidak
- **isVisible**: Menu ditampilkan atau tidak
- **routeName**: Route untuk navigasi (optional)
- **metadata**: Custom data untuk extensibility

## Contoh Use Case

### 1. Notifikasi Pesanan Baru

```dart
// Ketika ada pesanan baru dari API/WebSocket
final currentCount = state.menuItems[MenuIds.pesanan]?.badgeCount ?? 0;
bloc.add(HomeMenuBadgeUpdated(
  menuId: MenuIds.pesanan,
  count: currentCount + 1,
));
```

### 2. Fitur Baru (Dot Indicator)

```dart
// Ketika ada fitur promo baru
bloc.add(HomeMenuDotToggled(menuId: MenuIds.promo, showDot: true));

// Setelah user buka menu promo
bloc.add(HomeMenuDotToggled(menuId: MenuIds.promo, showDot: false));
```

### 3. Feature Flag / Permission

```dart
// Hide menu berdasarkan permission
if (!user.hasPermission('manage_employees')) {
  bloc.add(HomeMenuVisibilityChanged(
    menuId: MenuIds.karyawan,
    isVisible: false,
  ));
}
```

## Navigasi

Untuk menambahkan navigasi ke menu:

1. Set `routeName` di MenuItem
2. Update handler di `home_page.dart`:

```dart
void _handleMenuTap(MenuItem item) {
  if (item.routeName != null) {
    context.router.pushNamed(item.routeName!);
  }
}
```

## Styling

Semua styling menggunakan `DOColors` dan `DOTheme` dari package `widgets`.
Mendukung light/dark mode secara otomatis.

## Dependencies

- `freezed` - Immutable models
- `flutter_bloc` - State management
- `injectable` - Dependency injection
- `widgets` - Design system (DOColors, DOTheme)
- `shared` - Shared utilities (auto_route, get_it, dll)
