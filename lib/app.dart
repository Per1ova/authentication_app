import 'package:authentication_app/auth_repository.dart';
import 'package:authentication_app/home_screen.dart';
import 'package:authentication_app/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  // Attribute
  final AuthRepository auth;

  // Konstruktor
  const App(this.auth, {super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authentication App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: StreamBuilder<User?>(
        stream: widget.auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }

          if (snapshot.hasData) {
            return HomeScreen(auth: widget.auth,);
          } else {
            return LoginScreen(widget.auth);
          }
        },
      ),
    );
  }
}
