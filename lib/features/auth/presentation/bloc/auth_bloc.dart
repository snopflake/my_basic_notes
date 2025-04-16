import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_basic_notes/features/auth/domain/repositories/auth_repository.dart';
import 'package:my_basic_notes/features/auth/presentation/bloc/auth_event.dart';
import 'package:my_basic_notes/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  // penggunaan AuthInitial() dalam constructor super = menandai dia sbg titik awal/default UI
  AuthBloc(this.authRepository) : super(AuthInitial()) {

    on<AuthLoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await authRepository.login(event.email, event.password);
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    // Tips
    // event = objek yang dikirim user (biasanya isinya data dari UI, misal email & password)
    // emit = fungsi/method untuk mengubah state ke UI(misal AuthLoading, AuthSuccess)

    on<AuthSignUpRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await authRepository.signUp(event.email, event.password);
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

  }

}