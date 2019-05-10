import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: Container(
            child: Center(
              child: new CircularProgressIndicator(),
            )
        )
    );
  }
}
