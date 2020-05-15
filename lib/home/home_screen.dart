import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_recommendation/bloc/home/index.dart';

import 'package:movie_recommendation/model/single_movie.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/homeScreen';
  SingleMovie singleMovie;

  HomeScreen({this.singleMovie});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc homeBloc;
  @override
  void initState() {
    super.initState();
    homeBloc = BlocProvider.of<HomeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2c3848),
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    //color: Colors.green,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 5.0,
                          spreadRadius: 3.0),
                    ]),
                child: Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0)),
                      child: Image(
                        image: NetworkImage("${widget.singleMovie?.poster}"),
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 30.0, 10.0, 0.0),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              homeBloc.add(FetchAllMoviesEvent(
                                  searchMovies: widget.singleMovie.title));
                            },
                            color: Colors.white,
                            iconSize: 34.0,
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.favorite_border),
                            onPressed: () {
                              print("FavPressed");
                            },
                            color: Colors.white,
                            iconSize: 30.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: 20,
                  left: 10,
                ),
                child: Wrap(
                  children: <Widget>[
                    Text(
                      "${widget.singleMovie?.title}",
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      height: 35.0,
                      width: 140,
                      decoration: BoxDecoration(
                          color: Color(0xFF6c737f),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Text(
                        "WATCH NOW",
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "${widget.singleMovie?.imdbRating}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                      style: TextStyle(
                        color: Colors.white60,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                      ),
                      text: "${widget.singleMovie?.plot}"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RichText(
                  text: TextSpan(
                      style: TextStyle(
                        color: Colors.white60,
                        fontWeight: FontWeight.w800,
                        fontSize: 14.0,
                      ),
                      text: "Actors: ${widget.singleMovie?.actors}"),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 150.0, 0.0),
                child: RichText(
                  text: TextSpan(
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w800,
                        fontSize: 14.0,
                      ),
                      text: "Studio: ${widget.singleMovie?.production}"),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 130.0, 0.0),
                child: RichText(
                  text: TextSpan(
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w800,
                        fontSize: 15.0,
                      ),
                      text: "Genre: ${widget.singleMovie?.genre}"),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 240.0, 0.0),
                child: RichText(
                  text: TextSpan(
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w800,
                        fontSize: 15.0,
                      ),
                      text: "Release: ${widget.singleMovie?.year}"),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
