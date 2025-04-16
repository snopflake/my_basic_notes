import 'package:equatable/equatable.dart';

//tips

//props dalam equatable = properti
//properti(field) dari class yg akan dipake equatable untuk dibandingkan:
//apakah 2 oobject itu sama(equal)
//membandingkan isi object, bukan hanya identitas/instance nya ajah

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFailure extends AuthState {
  final String message;

  const AuthFailure(
    this.message
  );

  @override
  List<Object?> get props => [message];
}

