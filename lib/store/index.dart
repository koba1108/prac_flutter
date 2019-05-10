import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

@immutable
class AppState {
  final int counter;
  AppState(this.counter);
}

enum Actions {
  Increment,
  Decrement
}

AppState reducer(AppState prev, action) {
  switch (action) {
    case Actions.Increment: {
      return AppState(prev.counter + 1);
    }
    case Actions.Decrement: {
      return AppState(prev.counter - 1);
    }
  }
  return prev;
}

middleware(Store<AppState> store, action, NextDispatcher next) async {
  next(action);
}

Store initAppState() {
  return Store<AppState>(
      reducer,
      initialState: AppState(0),
      middleware: [middleware]
  );
}
