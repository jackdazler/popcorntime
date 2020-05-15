import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_recommendation/bloc/home/index.dart';
import 'package:movie_recommendation/home/home_page.dart';
import 'package:movie_recommendation/home/widgets/search_bar.dart';
import 'package:movie_recommendation/home/widgets/view_all.dart';
import 'home.dart';

void main() {
  HomeBloc homeBloc = HomeBloc();
  runApp(MaterialApp(
    title: "PopcornTime",
    debugShowCheckedModeBanner: false,
    routes: {
      Home.routeName: (context) => Home(),
      HomePage.routeName: (context) => HomePage(),
      SearchBar.routeName: (context) => SearchBar(),
      ViewAll.routeName: (context) => ViewAll(),
    },
    home: BlocProvider(
      create: (context) {
        return homeBloc;
      },
      child: Home(),
    ),
  ));
}
