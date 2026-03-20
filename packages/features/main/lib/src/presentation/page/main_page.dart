import 'package:flutter/material.dart';
import 'package:shared/shared.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return AutoTabsScaffold(
      floatingActionButtonBuilder: (context, tabsRouter) {
        return FloatingActionButton(
          onPressed: () {
            // Handle FAB action
          },
          backgroundColor: DOColors.primaryBlue,
          foregroundColor: Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          child: const Icon(Icons.add),
        );
      },
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBuilder: (context, tabsRouter) {
        return Container(
          decoration: BoxDecoration(
            color: isDark ? DOColors.darkSurface : DOColors.lightSurface,
            border: Border(
              top: BorderSide(
                color: isDark ? DOColors.borderDark : DOColors.borderLight,
                width: 1,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.05),
                blurRadius: 10,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: BottomAppBar(
            elevation: 0,
            color: Colors.transparent,
            notchMargin: 8,
            child: SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _NavBarItem(
                    icon: Icons.home_rounded,
                    label: 'Home',
                    isSelected: tabsRouter.activeIndex == 0,
                    onTap: () => tabsRouter.setActiveIndex(0),
                  ),
                  const SizedBox(width: 48), // Space for FAB
                  _NavBarItem(
                    icon: Icons.person_rounded,
                    label: 'Profile',
                    isSelected: tabsRouter.activeIndex == 1,
                    onTap: () => tabsRouter.setActiveIndex(1),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final color = isSelected
        ? DOColors.primaryBlue
        : (isDark ? DOColors.textMutedLight : DOColors.textMutedDark);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
