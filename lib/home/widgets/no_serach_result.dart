import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_recommendation/bloc/home/index.dart';
class NoSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          
            Icon(Icons.search,size: 30,color: Colors.black,),
            Text("No Results Found"),
          ],
        ),
        IconButton(icon: Icon(Icons.home,size: 40,), onPressed:()=>BlocProvider.of<HomeBloc>(context).add(FetchAllMoviesEvent(searchMovies: "avengers")))

      ],
    );
  }
}