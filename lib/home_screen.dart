import 'package:authentication_app/auth_repository.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final AuthRepository auth;

  const HomeScreen({super.key, required this.auth});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await auth.signOut();
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
