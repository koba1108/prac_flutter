import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/search.dart';
import 'pages/create.dart';
import 'pages/notifications.dart';
import 'pages/account.dart';
import 'store/index.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() {
  runApp(MyApp(store: initAppState()));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: App(),
      )
    );
  }
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int currentIndex = 0;
  List tabLayout = [
    Home(),
    Search(),
    Create(),
    Notifications(),
    Account()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          child: Text('タイトル'),
          onTap: () {
            print("click タイトル");
          },
        ),
        leading: InkWell(
          child: Icon(Icons.menu),
          onTap: () {
            print("click menu");
          },
        ),
        actions: <Widget>[
          InkWell(
            child: Icon(Icons.search),
            onTap: () {
              print("click search");
            },
          ),
          SizedBox(width: 10),
          InkWell(
            child: Icon(Icons.more_vert),
            onTap: () {
              print("click more");
            },
          ),
          SizedBox(width: 20)
        ],
      ),
      body: tabLayout[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,),
              title: Text('ホーム'),
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              title: Text('現在地'),
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              title: Text('インクリメント'),
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              title: Text('おしらせ'),
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('アカウント'),
              backgroundColor: Colors.blue,
            ),
          ]
      ),
    );
  }
}
