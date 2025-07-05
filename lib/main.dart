import 'package:authentication_app/app.dart';
import 'package:authentication_app/auth_repository.dart';
import 'package:authentication_app/firebase_auth_repository.dart';
import 'package:authentication_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

    
 Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
final AuthRepository auth = FirebaseAuthRepository();

  runApp(App(auth));
}
