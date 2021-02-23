// import 'package:flukit/flukit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/NewsData.dart';

import 'GetUrlData.dart';
import 'RssData.dart';
import 'NewsData.dart';
import 'RssItemWidget.dart';
import 'NewsItemWidget.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  RssJsonData rssJsonData;
  List<RssData> rssDataList = new List();
  // NewsJsonData newsJsonData;
  List<NewsData> newsDataList = new List();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.

      // getRssData(updateRssList);
      getNewsData(updateNewsList);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),

      // body: buildRssListView(this.rssJsonData, this.rssDataList),
      body: buildNewsListView(this.newsDataList),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void updateRssList(RssJsonData rssJsonData) {
    this.rssJsonData = rssJsonData;
    rssDataList.clear();
    rssDataList.addAll(this.rssJsonData.items);
    setState(() => {});
  }

  void updateNewsList(List<NewsData> newsDataList) {
    this.newsDataList.clear();
    this.newsDataList.addAll(newsDataList);
    setState(() => {});
  }
}

Widget buildRssListView(RssJsonData rssJsonData, List<RssData> list) {
  return ListView.builder(
    itemCount: list.length,
    itemBuilder: (context, index) {
      var rssData = list[index];
      return RssItemWidget(rssData, () {});
    },
  );
}

Widget buildNewsListView(List<NewsData> list) {
  return ListView.builder(
    itemCount: list.length,
    itemBuilder: (context, index) {
      var newsData = list[index];
      return NewsItemWidget(newsData, () {});
    },
  );
}
