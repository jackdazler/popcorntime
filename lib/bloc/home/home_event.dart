import 'dart:async';
import 'package:movie_recommendation/bloc/home/index.dart';
import 'package:meta/meta.dart';
import 'package:movie_recommendation/repository/movie_repository.dart';

@immutable
abstract class HomeEvent {
  Future<HomeState> applyAsync(
      {HomeState currentState, HomeBloc bloc});
}


class FetchAllMoviesEvent extends HomeEvent {
final int pagno;
final String searchMovies;
final MovieRepository movieRepository = MoviesFetch();

  FetchAllMoviesEvent({this.pagno,this.searchMovies});
   @override
  Future<HomeState> applyAsync
      ({HomeState currentState, HomeBloc bloc}) async {
    try {
      
    var movies =   await movieRepository.getAllMovies(pagno,searchMovies);
      return InHomeState(allMovies:movies);
      
    } catch (_, stackTrace) {
      print( '$stackTrace');
      return ErrorHomeState();
    }
      }
}


class FetchSingleMoviesEvent extends HomeEvent {
final String searchMovies;
final MovieRepository movieRepository = MoviesFetch();

  FetchSingleMoviesEvent({this.searchMovies});
   @override
  Future<HomeState> applyAsync
      ({HomeState currentState, HomeBloc bloc}) async {
      
    try {
    var movies =   await movieRepository.getSingleMovies(searchMovies);
      return SingleState(singleMovie:movies);
      
    } catch (_, stackTrace) {
      print( '$stackTrace');
      return ErrorHomeState();
    }
      }
}



