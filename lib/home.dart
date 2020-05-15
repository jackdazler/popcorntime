import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_recommendation/home/home_page.dart';
import 'package:movie_recommendation/home/home_screen.dart';
import 'package:movie_recommendation/home/widgets/no_serach_result.dart';
import 'package:movie_recommendation/home/widgets/search_bar.dart';

import 'bloc/home/index.dart';

class Home extends StatefulWidget {
  static const String routeName = '/home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
          bloc: BlocProvider.of<HomeBloc>(context),
          builder: (BuildContext context, HomeState state) {
            if (state is UnHomeState) return SearchBar();

            if (state is ErrorHomeState)
              return Center(
                child: Text(state.errorMessage),
              );

            if (state is LoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is InHomeState)
              return state.allMovies.search == null
                  ? NoSearch()
                  : HomePage(allMovies: state.allMovies);
            if (state is SingleState)
              return state.singleMovie.title == null
                  ? NoSearch()
                  : HomeScreen(singleMovie: state.singleMovie);
          }),
    );
  }
}
