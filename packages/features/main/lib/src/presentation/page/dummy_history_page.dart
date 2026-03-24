import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

@RoutePage()
class DummyHistoryPage extends StatelessWidget {
  const DummyHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Transaksi'),
        elevation: 0,
        centerTitle: true,
      ),
      extendBody: true,
      // Scaffold otomatis menangani safe area bottom untuk FAB.
      // Kustom bottom bar di MainPage tingginya: 54 (height) + 16 (margin bottom) = 70.
      // Kita tambahkan padding bottom 70.0 agar FAB ini nge-float persis di atas bottom bar
      // tanpa peduli ukuran safe area (iOS/Android).
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom),
        child: FloatingActionButton(
          onPressed: () => context.router.pushPath(AppRoutes.detail),
          child: const Icon(Icons.add),
        ),
      ),
      body: ListView.separated(
        // Untuk padding item terakhir di ListView, kita ambil tinggi bottom bar (70),
        // ditambah tinggi FAB (~56) + jarak gap, ditambah system padding (sejauh mana notch/home bar).
        // Ini menjamin konten tidak pernah terpotong walau di layar panjang/pendek.
        padding: EdgeInsets.only(
          left: 16,
          top: 16,
          right: 16,
          bottom: 160.0 + MediaQuery.paddingOf(context).bottom,
        ),
        itemCount: 15,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Theme.of(context).dividerColor.withValues(alpha: 0.1),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.02),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.receipt_long, color: Colors.blue),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Transaksi #${1000 + index}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '2${index % 9 + 1} Mar 2026, 14:${index.toString().padLeft(2, '0')}',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodySmall?.color,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Rp ${(index + 1) * 25}.000',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Selesai',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
