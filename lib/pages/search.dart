import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new Scaffold(
        body: new Container(
            child: new Center(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new IconButton(
                          icon: new Icon(Icons.search, color: Colors.redAccent),
                          iconSize: 100.0,
                          onPressed: () {
                            // Navigator.of(context).pushNamed("/tinder");
                          }
                      ),
                      new Text("Search")
                    ]
                )
            )
        )
    );
  }
}
