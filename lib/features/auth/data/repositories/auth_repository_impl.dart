import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {

  final FirebaseAuth _firebaseAuth;

  AuthRepositoryImpl(this._firebaseAuth);

    @override
  Future<void> signUp(String email, String username, String password) async {
    try {
      // 1. Buat akun di firebase auth
      final userCredential = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password);

      // 2. Simpan data tambahan (username & email) ke firestore
      await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredential.user!.uid)
        .set({
          'username': username,
          'email': email,
        });

    } catch (e) {
      throw Exception('Sign Up gagal: ${e.toString()}');
    }
  }

  @override
  Future<void> login(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password
    );
  }



}