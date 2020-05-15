import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_recommendation/bloc/home/index.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
static final HomeBloc _homeBlocSingleton = HomeBloc._internal();
factory HomeBloc()=>_homeBlocSingleton;
HomeBloc._internal();
  @override
  HomeState get initialState => UnHomeState();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    final currentState = state;
    try {
      yield LoadingState();
       yield await event.applyAsync(currentState: currentState, bloc: this);
  }catch (_, stackTrace) {
      print('$_ $stackTrace');
      yield currentState;
    }
}
}
