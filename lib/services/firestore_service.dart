import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<int> countDocumentsIncollection(String collectionName) async {
    try {
      var snapshot = await _firestore.collection(collectionName).get();
      int count = snapshot.docs.length;
      debugPrint("Collection: $collectionName has $count documents ");
      return count;
    } catch (e) {
      debugPrint("Error counting documents in $collectionName: $e");
      return 0;
    }
  }

  Future<Map<String, dynamic>?> getDocumentData(
    String collectionName,
    String documentId,
  ) async {
    try {
      var doc = await _firestore
          .collection(collectionName)
          .doc(documentId)
          .get();
      if (doc.exists) {
        var data = doc.data();
        debugPrint("Document $documentId data: $data");
        return data;
      } else {
        debugPrint("Document $documentId not exist!");
        return null;
      }
    } catch (e) {
      debugPrint("Error getting Document $documentId: $e");
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getAllDocumentsFromCollection(
    String collectionName,
  ) async {
    try {
      var snapshot = await _firestore.collection(collectionName).get();
      List<Map<String, dynamic>> documents = snapshot.docs
          .map((doc) => {'id': doc.id, ...doc.data()})
          .toList();

      debugPrint('Loaded ${documents.length} documents from $collectionName');
      return documents;
    } catch (e) {
      debugPrint('Error loading documents from $collectionName: $e');
      return [];
    }
  }
}
