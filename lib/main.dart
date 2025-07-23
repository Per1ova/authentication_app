import 'package:authentication_app/app.dart';
import 'package:authentication_app/auth_repository.dart';
import 'package:authentication_app/firebase_auth_repository.dart';
import 'package:authentication_app/firebase_options.dart';
import 'package:authentication_app/services/firestore_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //firebase function Aufgabe 2
  await _testFirestore();

  final AuthRepository auth = FirebaseAuthRepository();
  runApp(App(auth));
}

Future<void> _testFirestore() async {
  debugPrint("Aufgabe 2: Testing Firestore Functions");



  final service = FirestoreService();
  try {
    //1 Zähle die Anzahl der Dokumente in einer Sammlung
    int userCount = await service.countDocumentsIncollection('users');
    int playlistCount = await service.countDocumentsIncollection('playlists');
    debugPrint("Users: $userCount documents");
    debugPrint("Playlists: $playlistCount documents");

    //2.Rufe die Daten eines spezifischen Dokumentes ab
    debugPrint("2. GETTING SPECIFIC DOCUMENT:");
    var userData = await service.getDocumentData(
      'users',
      'IlEHXTPQ4GHMRKtDhF3u',
    );
    debugPrint("User data retrieved: $userData");
    var playlistData = await service.getDocumentData(
      'playlists',
      '0dTBj2HPc9lVPxEKftrU',
    );
    debugPrint("Playlist data retrieved: $playlistData");

    //3 Lade alle Dokumente einer Sammlung
    debugPrint("3. LOADING ALL DOCUMENTS:");
    var allUsers = await service.getAllDocumentsFromCollection('users');
    var allPlaylists = await service.getAllDocumentsFromCollection('playlists');
    debugPrint("All users loaded: ${allUsers.length} documents");
    debugPrint("All playlists loaded: ${allPlaylists.length} documents");

    debugPrint("ALL 3 Functions Working!");

  } catch (e) {
    debugPrint("Error testing Firestore: $e");
  }
}
