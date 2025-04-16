import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:my_basic_notes/features/auth/domain/repositories/auth_repository.dart';
import 'package:my_basic_notes/features/auth/domain/repositories/auth_repository_impl.dart';
import 'package:my_basic_notes/features/auth/domain/usecases/login_usecase.dart';
import 'package:my_basic_notes/features/auth/domain/usecases/signup_usecase.dart';
import 'package:my_basic_notes/features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {

  //Repositories
 sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(FirebaseAuth.instance));

  //Usecases
  sl.registerLazySingleton(() => LoginUsecase(sl()));
  sl.registerLazySingleton(() => SignupUsecase(sl()));

  //Bloc
  sl.registerFactory(() => AuthBloc(sl()));

}