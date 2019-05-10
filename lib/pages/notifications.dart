import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new Scaffold(
        body: new Container(
            child: new Center(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new IconButton(
                        icon: new Icon(Icons.notifications_active, color: Colors.red),
                        iconSize: 70.0,
                        onPressed: null,
                      ),
                      new Text("Notification")
                    ]
                )
            )
        )
    );
  }
}
