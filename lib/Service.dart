import 'package:cloud_firestore/cloud_firestore.dart';

class DataService {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('Register_Student');

  Future<String?> getUserNameByEmail(String email) async {
    try {
      QuerySnapshot querySnapshot =
          await usersCollection.where('Email', isEqualTo: email).limit(1).get();

      if (querySnapshot.docs.isNotEmpty) {
        Map<String, dynamic>? userData =
            querySnapshot.docs.first.data() as Map<String, dynamic>?;
        if (userData != null &&
            userData.containsKey('FirstName') &&
            userData.containsKey('FirstName')) {
          return userData['FirstName'];
        } else {
          throw Exception("'Name' field not found in document");
        }
      } else {
        throw Exception("Document not found for email: $email");
      }
    } catch (e) {
      print("Error retrieving user name: $e");
      return null; // Return null in case of error
    }
  }
}
