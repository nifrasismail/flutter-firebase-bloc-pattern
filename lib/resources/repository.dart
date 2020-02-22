import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_with_bloc/resources/firestore_provider.dart';
import 'package:flutter_firebase_with_bloc/resources/mlkit_provider.dart';

class Repository {
  final _firestoreProvider = FirestoreProvider();
  final _mlkitProvider = MLkitProvider();

  Future<int> authenticateUsers(String email, String password) =>
      _firestoreProvider.authenticateUser(email, password);

  Future<void> registerUser(String email, String password) =>
      _firestoreProvider.register(email, password);

  Future<String> extractText(var image) => _mlkitProvider.getImage(image);

  Future<void> uploadGoal(String email, String title, String goal) =>
      _firestoreProvider.uploadGoal(title, email, goal);

  Stream<DocumentSnapshot> myGoalList(String email) =>
      _firestoreProvider.myGoalList(email);

  Stream<QuerySnapshot> othersGoalList() => _firestoreProvider.othersGoalList();

  void removeGoal(String title, email) =>
      _firestoreProvider.removeGoal(title, email);
}
