// import 'package:cloud_firestore/cloud_firestore.dart';
// Future<List<Map<String, dynamic>>> fetchUserProfiles() async {
//   QuerySnapshot querySnapshot =
//       await FirebaseFirestore.instance.collection('users').get();

//   return querySnapshot.docs.map((doc) => doc.data()).toList();
// }

// Map<String, dynamic> findBestMatch(
//     Map<String, dynamic> currentUser, List<Map<String, dynamic>> profiles) {
//   double maxScore = 0;
//   Map<String, dynamic> bestMatch;

//   for (var profile in profiles) {
//     double score = calculateMatchScore(currentUser, profile);

//     if (score > maxScore) {
//       maxScore = score;
//       bestMatch = profile;
//     }
//   }

//   return bestMatch;
// }

// double calculateMatchScore(
//     Map<String, dynamic> user1, Map<String, dynamic> user2) {
//   // Your scoring logic here, comparing preferences, interests, etc.
//   // Return a score (0 to 1) where 1 is a perfect match.
//   return 0.5; // Placeholder value; implement your scoring logic.
// }




















