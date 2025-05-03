import 'package:my_basic_notes/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {

  UserModel ({
    required String uid,
    required String email,
    required this.username,
  }) : super(uid: uid, email: email);

  final String username;

  //Convert Firestore ke UserModel
  factory UserModel.fromMap(Map<String, dynamic> map, String uid) {
    return UserModel(
      uid: uid, 
      email: map['email'] ?? '', 
      username: map['username'] ?? '',
    );
  }

  //Convert UserModel ke Map (save ke firestore)
  Map<String, dynamic> toMap() {
    return {
      'email' : email,
      'username' : username,
    };
  }

}