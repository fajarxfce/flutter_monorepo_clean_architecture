import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

import 'menu_item.dart';

/// Centralized registry for all menu items and groups.
///
/// To add a new menu:
/// 1. Add a static const id in [MenuIds]
/// 2. Add the [MenuItem] definition in the appropriate section below
/// 3. Assign it to a group in [menuGroups] or [primaryMenuIds]
///
/// The BLoC will handle reactive state (badges, visibility) separately.
class MenuRegistry {
  MenuRegistry._();

  /// Menu items displayed on the home page grid (max 7 + "Lainnya")
  static const List<String> primaryMenuIds = [
    MenuIds.kasir,
    MenuIds.produk,
    MenuIds.laporan,
    MenuIds.pelanggan,
    MenuIds.pesanan,
    MenuIds.stok,
    MenuIds.promo,
  ];

  /// All available menu items indexed by ID
  static final Map<String, MenuItem> allMenus = {
    // === Keuangan ===
    MenuIds.kasir: MenuItem(
      id: MenuIds.kasir,
      label: 'Kasir',
      icon: Icons.point_of_sale_rounded,
      iconColor: Colors.white,
      backgroundColor: DOColors.primaryBlue,
    ),
    MenuIds.laporan: MenuItem(
      id: MenuIds.laporan,
      label: 'Laporan',
      icon: Icons.bar_chart_rounded,
      iconColor: Colors.white,
      backgroundColor: const Color(0xFF7C3AED),
    ),
    MenuIds.hutangPiutang: MenuItem(
      id: MenuIds.hutangPiutang,
      label: 'Hutang Piutang',
      icon: Icons.account_balance_wallet_rounded,
      iconColor: Colors.white,
      backgroundColor: const Color(0xFFD97706),
    ),
    MenuIds.pengeluaran: MenuItem(
      id: MenuIds.pengeluaran,
      label: 'Pengeluaran',
      icon: Icons.money_off_rounded,
      iconColor: Colors.white,
      backgroundColor: const Color(0xFFDC2626),
    ),

    // === Manajemen Produk ===
    MenuIds.produk: MenuItem(
      id: MenuIds.produk,
      label: 'Produk',
      icon: Icons.inventory_2_rounded,
      iconColor: Colors.white,
      backgroundColor: const Color(0xFF059669),
    ),
    MenuIds.stok: MenuItem(
      id: MenuIds.stok,
      label: 'Stok',
      icon: Icons.warehouse_rounded,
      iconColor: Colors.white,
      backgroundColor: const Color(0xFF0891B2),
    ),
    MenuIds.kategori: MenuItem(
      id: MenuIds.kategori,
      label: 'Kategori',
      icon: Icons.category_rounded,
      iconColor: Colors.white,
      backgroundColor: const Color(0xFF4F46E5),
    ),
    MenuIds.supplier: MenuItem(
      id: MenuIds.supplier,
      label: 'Supplier',
      icon: Icons.local_shipping_rounded,
      iconColor: Colors.white,
      backgroundColor: const Color(0xFF9333EA),
    ),

    // === Penjualan ===
    MenuIds.pesanan: MenuItem(
      id: MenuIds.pesanan,
      label: 'Pesanan',
      icon: Icons.receipt_long_rounded,
      iconColor: Colors.white,
      backgroundColor: const Color(0xFFEA580C),
    ),
    MenuIds.pelanggan: MenuItem(
      id: MenuIds.pelanggan,
      label: 'Pelanggan',
      icon: Icons.people_rounded,
      iconColor: Colors.white,
      backgroundColor: const Color(0xFF2563EB),
    ),
    MenuIds.promo: MenuItem(
      id: MenuIds.promo,
      label: 'Promo',
      icon: Icons.local_offer_rounded,
      iconColor: Colors.white,
      backgroundColor: const Color(0xFFE11D48),
    ),
    MenuIds.riwayat: MenuItem(
      id: MenuIds.riwayat,
      label: 'Riwayat',
      icon: Icons.history_rounded,
      iconColor: Colors.white,
      backgroundColor: const Color(0xFF6366F1),
    ),

    // === Pengaturan ===
    MenuIds.karyawan: MenuItem(
      id: MenuIds.karyawan,
      label: 'Karyawan',
      icon: Icons.badge_rounded,
      iconColor: Colors.white,
      backgroundColor: const Color(0xFF0D9488),
    ),
    MenuIds.pengaturan: MenuItem(
      id: MenuIds.pengaturan,
      label: 'Pengaturan',
      icon: Icons.settings_rounded,
      iconColor: Colors.white,
      backgroundColor: const Color(0xFF64748B),
    ),
    MenuIds.bantuan: MenuItem(
      id: MenuIds.bantuan,
      label: 'Bantuan',
      icon: Icons.help_outline_rounded,
      iconColor: Colors.white,
      backgroundColor: const Color(0xFF78716C),
    ),
  };

  /// Menu groups for the "Lainnya" bottom sheet
  static List<MenuGroup> get menuGroups => [
        MenuGroup(
          id: 'keuangan',
          title: 'Keuangan',
          order: 0,
          items: _resolveItems([
            MenuIds.kasir,
            MenuIds.laporan,
            MenuIds.hutangPiutang,
            MenuIds.pengeluaran,
          ]),
        ),
        MenuGroup(
          id: 'manajemen_produk',
          title: 'Manajemen Produk',
          order: 1,
          items: _resolveItems([
            MenuIds.produk,
            MenuIds.stok,
            MenuIds.kategori,
            MenuIds.supplier,
          ]),
        ),
        MenuGroup(
          id: 'penjualan',
          title: 'Penjualan',
          order: 2,
          items: _resolveItems([
            MenuIds.pesanan,
            MenuIds.pelanggan,
            MenuIds.promo,
            MenuIds.riwayat,
          ]),
        ),
        MenuGroup(
          id: 'pengaturan',
          title: 'Pengaturan',
          order: 3,
          items: _resolveItems([
            MenuIds.karyawan,
            MenuIds.pengaturan,
            MenuIds.bantuan,
          ]),
        ),
      ];

  static List<MenuItem> _resolveItems(List<String> ids) {
    return ids
        .where((id) => allMenus.containsKey(id))
        .map((id) => allMenus[id]!)
        .toList();
  }
}

/// Centralized menu ID constants.
/// Use these to reference menus throughout the app.
abstract class MenuIds {
  // Keuangan
  static const String kasir = 'kasir';
  static const String laporan = 'laporan';
  static const String hutangPiutang = 'hutang_piutang';
  static const String pengeluaran = 'pengeluaran';

  // Manajemen Produk
  static const String produk = 'produk';
  static const String stok = 'stok';
  static const String kategori = 'kategori';
  static const String supplier = 'supplier';

  // Penjualan
  static const String pesanan = 'pesanan';
  static const String pelanggan = 'pelanggan';
  static const String promo = 'promo';
  static const String riwayat = 'riwayat';

  // Pengaturan
  static const String karyawan = 'karyawan';
  static const String pengaturan = 'pengaturan';
  static const String bantuan = 'bantuan';
}
