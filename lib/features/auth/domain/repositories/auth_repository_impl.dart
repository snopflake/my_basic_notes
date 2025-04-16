import 'auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {

  final FirebaseAuth _firebaseAuth;

  AuthRepositoryImpl(this._firebaseAuth);

    @override
  Future<void> signUp(String email, String password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password
    );
  }

  @override
  Future<void> login(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email, 
      password: password
    );
  }



}