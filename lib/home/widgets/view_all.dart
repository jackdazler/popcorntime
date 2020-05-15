import 'package:flutter/material.dart';
import 'package:movie_recommendation/model/all_movie.dart';

class ViewAll extends StatefulWidget {
  static const String routeName = '/viewall';
 final AllMovies allMovies;
  ViewAll({this.allMovies});
  @override
  _ViewAllState createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2c3848),
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.28,
            color: Color(0xFF5da0d4),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        color: Colors.white,
                        iconSize: 34,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.settings),
                        onPressed: () {
                         
                        },
                        iconSize: 34,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 0.0, 10.0, 10.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        height: 40.0,
                        width: 160.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12.0),
                                bottomLeft: Radius.circular(12.0))),
                        child: Text(
                          "Now",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 40.0,
                        width: 160.0,
                        decoration: BoxDecoration(
                            color: Color(0xFF8ebde0),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12.0),
                                bottomRight: Radius.circular(12.0))),
                        child: Text(
                          "Soon",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              // color: Colors.yellow,
              child: ListView.builder(
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: widget.allMovies?.search?.length ?? 0,
                  itemBuilder: (context, int index) {
                    Search allMovie = widget.allMovies?.search[index];
                    return Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 25.0),
                          child: Container(
                            decoration: BoxDecoration(
                              //color: Colors.green,
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  spreadRadius: 6.0,
                                  offset: Offset(0, 2.0),
                                  blurRadius: 3.0,
                                ),
                              ],
                            ),
                            child: Stack(
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image(
                                    image: NetworkImage('${allMovie?.poster}'),
                                    height: 250,
                                    width: 320,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 12.0,
                                  left: 15.0,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 35.0,
                                    width: 40.0,
                                    child: Text(
                                      "16+",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                  ),
                                ),
                                Positioned(
                                  bottom: 1.0,
                                  child: Container(
                                    width: 320,
                                    //height: 100,
                                    //color: Colors.pink,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            height: 40,
                                            width: 200,
                                            child: Text(
                                              allMovie?.title,
                                              maxLines: 2,
                                              overflow: TextOverflow.clip,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Text("Year: ${allMovie.year}",
                                              maxLines: 2,
                                              overflow: TextOverflow.clip,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
