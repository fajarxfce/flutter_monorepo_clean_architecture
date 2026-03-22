import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DummyInventoryPage extends StatelessWidget {
  const DummyInventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Inventory (Dummy) Pagenya masih kosong nunggu BE'),
      ),
    );
  }
}
