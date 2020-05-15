import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_recommendation/bloc/home/home_bloc.dart';
import 'package:movie_recommendation/bloc/home/index.dart';
import 'package:movie_recommendation/home/widgets/top_rated_movies.dart';
import 'package:movie_recommendation/home/widgets/view_all.dart';
import 'package:movie_recommendation/model/all_movie.dart';

class RecommendedMovies extends StatefulWidget {
  final AllMovies allMovies;
  RecommendedMovies({this.allMovies});

  @override
  _RecommendedMoviesState createState() => _RecommendedMoviesState();
}

class _RecommendedMoviesState extends State<RecommendedMovies> {
  HomeBloc homeBloc;
   int pageNo=1;
   

  @override
  void initState() {
    super.initState();
    homeBloc = BlocProvider.of<HomeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Color(0xFF2c3848),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 40.0, right: 0.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "RECOMMENDED FOR YOU",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ViewAll(
                        allMovies: widget.allMovies,
                      );
                    }));
                  },
                  child: Text(
                    "See all",
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.40,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.allMovies?.search?.length ?? 0,
                itemBuilder: (context, int index) {
                  final Search allMovies = widget.allMovies.search[index];
                  return GestureDetector(
                    onTap: () {
                      homeBloc.add(FetchSingleMoviesEvent(
                          searchMovies: allMovies.title.toLowerCase()));
                    },
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Positioned(
                          bottom: 10.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: 100.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.center,
                                    width: 150.0,
                                    child: Text(
                                      allMovies.title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.0,
                                  ),
                                  Text(
                                    'Year ${allMovies.year}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(0, 2),
                                    blurRadius: 5.0,
                                    spreadRadius: 3.0)
                              ],
                            ),
                            child: Stack(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image(
                                    image: NetworkImage(
                                      "${allMovies?.poster}",
                                    ),
                                    width: 200,
                                    // height: 210,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Expanded(
              child: TopRatedMovies(
            allMovies: widget.allMovies,
          )),
        ],
      ),
    );
  }
}
