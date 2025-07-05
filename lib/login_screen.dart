import 'package:authentication_app/auth_repository.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final AuthRepository auth;

  const LoginScreen(this.auth, {super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      
    );
  }
}
