import 'package:prac_flutter/store/index.dart';
import 'package:redux/redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Create extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new Scaffold(
        body: new Container(
            child: new Center(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('足し引きするよ', style: Theme.of(context).textTheme.display1,),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            StoreConnector(
                                converter: (Store<AppState> store) {
                                  return () => store.dispatch(Actions.Increment);
                                },
                                builder: (context, callback) => IconButton(
                                  icon: new Icon(Icons.add, color: Colors.redAccent),
                                  highlightColor: Colors.grey,
                                  iconSize: 100.0,
                                  onPressed: callback,
                                )
                            ),
                            StoreConnector(
                                converter: (Store<AppState> store) {
                                  return () => store.dispatch(Actions.Decrement);
                                },
                                builder: (context, callback) => IconButton(
                                  icon: new Icon(Icons.remove, color: Colors.redAccent),
                                  highlightColor: Colors.grey,
                                  iconSize: 100.0,
                                  onPressed: callback,
                                )
                            ),
                          ]
                      ),
                      StoreConnector(
                        converter: (Store<AppState> store) => store.state.counter,
                        builder: (context, counter) => Text(
                          '$counter',
                          style: Theme.of(context).textTheme.display1,
                        ),
                      ),
                    ]
                )
            )
        )
    );
  }
}
