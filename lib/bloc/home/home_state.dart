
import 'package:equatable/equatable.dart';
import 'package:movie_recommendation/model/all_movie.dart';
import 'package:movie_recommendation/model/single_movie.dart';

abstract class HomeState extends Equatable {

  final List propss;
  HomeState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnHomeState extends HomeState {

   UnHomeState();

  @override
  String toString() => 'UnHomeState';
}
//loading
class LoadingState extends HomeState {

   LoadingState();

  @override
  String toString() => 'LoadingState';
}
/// Initialized
class InHomeState extends HomeState {
  final AllMovies allMovies;
 
 InHomeState({this.allMovies}) : super([allMovies]);

  @override
  String toString() => 'InHomeState $allMovies';

}
class SingleState extends HomeState {
 
  final SingleMovie singleMovie;

 SingleState({this.singleMovie}) : super([singleMovie]);

  @override
  String toString() => 'SingleState $SingleState';

}


class ErrorHomeState extends HomeState {
  final String errorMessage;

 ErrorHomeState({this.errorMessage}): super([errorMessage]);
  
  @override
  String toString() => 'ErrorHomeState';
}
