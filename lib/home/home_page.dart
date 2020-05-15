import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_recommendation/bloc/home/index.dart';
import 'package:movie_recommendation/home/widgets/recommended_movies.dart';

import 'package:movie_recommendation/model/all_movie.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/homePage';
  HomeBloc homeBloc;
 
  final AllMovies allMovies;
  HomePage({this.allMovies, this.homeBloc});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    widget.homeBloc = BlocProvider.of<HomeBloc>(context);
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Container(
        width: 300,
        height: 34.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color(0xFF8ebde0),
            borderRadius: BorderRadius.circular(30.0)),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
              color: Colors.white,
            ),
            Expanded(
              child: TextField(
                onSubmitted: (val) {
                  widget.homeBloc.add(
                      FetchAllMoviesEvent(searchMovies: val.toLowerCase()));
                },
                style: TextStyle(
                  color: Colors.white,
                ),
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration.collapsed(
                  hintStyle: TextStyle(
                    color: Colors.white60,
                  ),
                  hintText: "Search",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5da0d4),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(top: 50, left: 30, right: 30.0, bottom: 0.0),
              child: Text(
                "Hello, what do you want to watch ?",
                style: TextStyle(
                  letterSpacing: 1.2,
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildSearchBar(),
            SizedBox(
              height: 35.0,
            ),
            RecommendedMovies(
              allMovies: widget.allMovies,
            ),
          ],
        ),
      ),
    );
  }
}
