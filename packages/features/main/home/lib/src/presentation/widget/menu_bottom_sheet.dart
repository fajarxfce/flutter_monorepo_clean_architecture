import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

import '../../domain/model/menu_item.dart';

/// Bottom sheet that displays all menu items grouped by category.
///
/// Called when user taps "Lainnya" button.
class MenuBottomSheet extends StatelessWidget {
  final List<MenuGroup> groups;
  final void Function(MenuItem item)? onItemTap;

  const MenuBottomSheet({
    super.key,
    required this.groups,
    this.onItemTap,
  });

  static Future<void> show(
    BuildContext context, {
    required List<MenuGroup> groups,
    void Function(MenuItem item)? onItemTap,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => MenuBottomSheet(
        groups: groups,
        onItemTap: onItemTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      constraints: BoxConstraints(
        maxHeight: screenHeight * 0.85,
      ),
      decoration: BoxDecoration(
        color: isDark ? DOColors.darkBackground : DOColors.lightBackground,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: isDark
                  ? Colors.white.withOpacity(0.3)
                  : Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
            child: Row(
              children: [
                Text(
                  'Semua Menu',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDark ? DOColors.textLight : DOColors.textDark,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.close_rounded,
                    color: isDark ? DOColors.textLight : DOColors.textDark,
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1),

          // Menu groups
          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemCount: groups.length,
              separatorBuilder: (context, index) => const SizedBox(height: 24),
              itemBuilder: (context, index) {
                final group = groups[index];
                return _buildMenuGroup(context, group);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuGroup(BuildContext context, MenuGroup group) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Group title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            group.title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isDark ? DOColors.textMutedLight : DOColors.textMutedDark,
              letterSpacing: 0.5,
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Menu items grid
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.85,
            ),
            itemCount: group.items.length,
            itemBuilder: (context, index) {
              final item = group.items[index];
              return _buildMenuItem(context, item);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(BuildContext context, MenuItem item) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Opacity(
      opacity: item.isEnabled ? 1.0 : 0.5,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: item.isEnabled
              ? () {
                  Navigator.of(context).pop();
                  onItemTap?.call(item);
                }
              : null,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon with badge
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: item.backgroundColor ?? DOColors.primaryBlue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        item.icon,
                        color: item.iconColor ?? Colors.white,
                        size: 24,
                      ),
                    ),

                    // Badge
                    if (item.badgeCount > 0)
                      Positioned(
                        top: -4,
                        right: -4,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 1,
                          ),
                          decoration: BoxDecoration(
                            color: DOColors.error,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: isDark
                                  ? DOColors.darkBackground
                                  : DOColors.lightBackground,
                              width: 1.5,
                            ),
                          ),
                          constraints: const BoxConstraints(minWidth: 18),
                          child: Text(
                            item.badgeCount > 99 ? '99+' : '${item.badgeCount}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                              height: 1.2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),

                    // Dot
                    if (item.showDot && item.badgeCount == 0)
                      Positioned(
                        top: -2,
                        right: -2,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: DOColors.success,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isDark
                                  ? DOColors.darkBackground
                                  : DOColors.lightBackground,
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),

                const SizedBox(height: 6),

                // Label
                Text(
                  item.label,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: isDark ? DOColors.textLight : DOColors.textDark,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
