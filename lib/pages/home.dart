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
    this.setState(() {
      isLoading = true;
    });
    var response = await http.get(
        Uri.encodeFull("https://api.github.com/events"),
        headers: {
          "Accept": "application/json"
        }
    );
    this.setState(() {
      data = jsonDecode(response.body);
      isLoading = false;
    });
    return "OK";
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = new ScrollController();

    return Scaffold(
        body: RefreshIndicator(
          onRefresh: this.getData,
          child: isLoading ? Loader() : ListView.builder(
            controller: _scrollController,
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
        ),
        floatingActionButton: FloatingActionButton(
          child: data == null ? Icon(Icons.search) : Icon(Icons.arrow_upward),
          onPressed: () {
            if (data == null) {
              this.getData();
            } else {
              _scrollController.animateTo(
                0.0,
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 300),
              );
            }
          }
        )
    );
  }
}
