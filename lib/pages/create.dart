import 'package:flutter/material.dart';

class Create extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new Scaffold(
        body: new Container(
            child: new Center(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new IconButton(
                          icon: new Icon(Icons.create_new_folder, color: Colors.redAccent),
                          iconSize: 100.0,
                          onPressed: () {
                            // Navigator.of(context).pushNamed("/tinder");
                          }
                      ),
                      new Text("Create")
                    ]
                )
            )
        )
    );
  }
}
