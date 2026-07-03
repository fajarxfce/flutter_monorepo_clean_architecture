import 'package:flutter/material.dart';

import '../../domain/model/menu_item.dart';
import 'menu_item_card.dart';

/// Grid of menu items for the home page.
///
/// Displays up to 7 menu items + a "Lainnya" (More) button.
class MenuGrid extends StatelessWidget {
  final List<MenuItem> items;
  final VoidCallback? onMoreTap;
  final void Function(MenuItem item)? onItemTap;

  const MenuGrid({
    super.key,
    required this.items,
    this.onMoreTap,
    this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    // Take max 7 items for the grid
    final displayItems = items.take(7).toList();

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemCount: displayItems.length + 1, // +1 for "Lainnya"
      itemBuilder: (context, index) {
        // Last item is "Lainnya"
        if (index == displayItems.length) {
          return _buildMoreButton(context);
        }

        final item = displayItems[index];
        return MenuItemCard(
          item: item,
          onTap: () => onItemTap?.call(item),
        );
      },
    );
  }

  Widget _buildMoreButton(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onMoreTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isDark
                ? const Color(0xFF1E293B).withOpacity(0.5)
                : const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isDark
                  ? Colors.white.withOpacity(0.1)
                  : Colors.black.withOpacity(0.05),
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: isDark
                      ? Colors.white.withOpacity(0.1)
                      : Colors.black.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.apps_rounded,
                  color: isDark ? Colors.white70 : Colors.black54,
                  size: 28,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Lainnya',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white70 : Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
