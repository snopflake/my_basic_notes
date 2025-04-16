import 'auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {

  final FirebaseAuth _firebaseAuth;

  AuthRepositoryImpl(this._firebaseAuth);

    @override
  Future<void> signUp(String email, String username, String password) async {
    try {
      // Buat akun di firebase auth
      final UserCredential = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password);

      // Simpan data tambahan (username & email) ke firestore
    } catch (e) {

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