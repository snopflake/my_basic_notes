import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// === Event ===
abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class TabChanged extends MainEvent {
  final int index;

  const TabChanged(
    this.index
  );

  @override
  List<Object> get props => [index];
}

// === State ===
class MainState extends Equatable {
  final int currentIndex;

  const MainState(
    this.currentIndex
  );

  @override
  List<Object> get props => [currentIndex];
}

// === Bloc ===
class MainBloc extends Bloc<MainEvent, MainState>{
  MainBloc() : super(const MainState(0)) {
    on<TabChanged>((event, emit) {
      emit(MainState(event.index));
    });
  }
}