import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:widgets/widgets.dart';

import '../../domain/model/menu_item.dart';
import '../bloc/home_menu_bloc.dart';
import '../bloc/home_menu_event.dart';
import '../bloc/home_menu_state.dart';
import '../widget/menu_bottom_sheet.dart';
import '../widget/menu_grid.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeMenuBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = GetIt.instance<HomeMenuBloc>();
    _bloc.add(const HomeMenuStarted());

    // Example: Simulate badge updates after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        _bloc.add(const HomeMenuBadgeUpdated(menuId: 'pesanan', count: 5));
        _bloc.add(const HomeMenuBadgeUpdated(menuId: 'laporan', count: 2));
        _bloc.add(const HomeMenuDotToggled(menuId: 'promo', showDot: true));
      }
    });
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        backgroundColor: isDark ? DOColors.darkBackground : DOColors.lightBackground,
        body: SafeArea(
          child: BlocBuilder<HomeMenuBloc, HomeMenuState>(
            builder: (context, state) {
              if (!state.isInitialized) {
                return const Center(child: CircularProgressIndicator());
              }

              return CustomScrollView(
                slivers: [
                  // App Bar
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Halo, User!',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: isDark ? DOColors.textLight : DOColors.textDark,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Selamat datang kembali',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: isDark
                                      ? DOColors.textMutedLight
                                      : DOColors.textMutedDark,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          // Notification icon with badge
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.notifications_outlined,
                                  color: isDark ? DOColors.textLight : DOColors.textDark,
                                  size: 28,
                                ),
                              ),
                              if (state.totalBadgeCount > 0)
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: const BoxDecoration(
                                      color: DOColors.error,
                                      shape: BoxShape.circle,
                                    ),
                                    constraints: const BoxConstraints(
                                      minWidth: 8,
                                      minHeight: 8,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Menu Grid
                  SliverToBoxAdapter(
                    child: MenuGrid(
                      items: state.primaryMenuItems,
                      onMoreTap: () => _showMenuBottomSheet(context, state),
                      onItemTap: _handleMenuTap,
                    ),
                  ),

                  // Additional content can go here
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ringkasan Hari Ini',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: isDark ? DOColors.textLight : DOColors.textDark,
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildSummaryCard(
                            context,
                            'Total Penjualan',
                            'Rp 2.450.000',
                            Icons.trending_up_rounded,
                            DOColors.success,
                          ),
                          const SizedBox(height: 12),
                          _buildSummaryCard(
                            context,
                            'Transaksi',
                            '24 transaksi',
                            Icons.receipt_long_rounded,
                            DOColors.primaryBlue,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? DOColors.darkSurface : DOColors.lightSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark
              ? DOColors.borderDark.withOpacity(0.3)
              : DOColors.borderLight,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 13,
                    color: isDark
                        ? DOColors.textMutedLight
                        : DOColors.textMutedDark,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDark ? DOColors.textLight : DOColors.textDark,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showMenuBottomSheet(BuildContext context, HomeMenuState state) {
    MenuBottomSheet.show(
      context,
      groups: state.reactiveMenuGroups,
      onItemTap: _handleMenuTap,
    );
  }

  void _handleMenuTap(MenuItem item) {
    // TODO: Navigate to the appropriate route
    // For now, just show a snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Tapped: ${item.label}'),
        duration: const Duration(seconds: 1),
      ),
    );

    // Example: Navigate using AutoRoute
    // if (item.routeName != null) {
    //   context.router.pushNamed(item.routeName!);
    // }
  }
}
