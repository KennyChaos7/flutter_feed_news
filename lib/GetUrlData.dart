import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'NewsData.dart';
import 'RssData.dart';

// const String url = "http://54.249.206.172:8080/rss.json";
const String url = "http://54.249.206.172:8080/news_data.json";

void getRssData(void Function(RssJsonData rssJsonData) updateList) async {
  try {
    Response response = await Dio().get(url);
    Map userMap = jsonDecode(response.toString());
    RssJsonData jsonData = new RssJsonData.fromJson(userMap);
    var list = jsonData.items;
    if (list.isNotEmpty && list.length > 0) {
      for (int index = 0; index < list.length; index++) {
        var rssData = list[index];
        rssData.index = index;
        rssData.timeStampCut =
            new DateFormat.Hm().format(DateTime.parse(rssData.timeStamp));
        list[index] = rssData;
        print(rssData.toJson());
      }
    }
    updateList(jsonData);
  } catch (e) {}
}

void getNewsData(void Function(List<NewsData> newsDataList) updateList) async {
  try {
    Response<List> response = await Dio().get(url);
    var list = response.data;
    List<NewsData> jsonDataList = new List();
    if (list.isNotEmpty && list.length > 0) {
      for (int index = 0; index < list.length; index++) {
        var newsData = NewsData.fromJson(list[index]);
        newsData.index = index + 1;
        newsData.timeStampCut =
            new DateFormat.Hm().format(DateTime.parse(newsData.timeStamp));
        jsonDataList.add(newsData);
        print(newsData.toJson());
      }
    }
    updateList(jsonDataList);
  } catch (e) {}
}
