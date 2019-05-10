import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prac_flutter/components/loader.dart';

class Home extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<Home> {
  bool isLoading = false;
  List data;

  Future<String> getData() async {
    isLoading = true;
    var response = await http.get(
        Uri.encodeFull("https://api.github.com/events"),
        headers: {
          "Accept": "application/json"
        }
    );
    this.setState(() {
      data = jsonDecode(response.body);
    });
    isLoading = false;
    return "OK";
  }

  @override
  void initState() {
    super.initState();
    if (data == null) {
      this.getData();
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(body: new Stack(
        children: [
          isLoading ? Loader() : ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.person),
                          title: Text(data[index]["actor"]["login"]),
                          subtitle: Text(data[index]["actor"]["id"].toString()),
                        ),
                        FadeInImage.assetNetwork(
                          placeholder: 'assets/images/loading-snake.gif',
                          image: data[index]["actor"]["avatar_url"],
                          width: 512,
                          height: 512,
                        ),
                      ]
                  )
              );
            },
          ),
       ]
    ));
  }
}
