import 'package:flutter/material.dart';

class App extends StatelessWidget {
   // Attribute


  // Konstruktor
  const App({super.key}); 

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
