import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const Center(child: Text('Profile Page')));
  }
}
