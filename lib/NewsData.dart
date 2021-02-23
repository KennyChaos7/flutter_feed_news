class NewsData {
  final String url;
  final String title;
  final String timeStamp;
  final int id;
  int index;
  String timeStampCut;

  NewsData.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        url = json['jumpLink'],
        title = json['title'],
        timeStamp = json['updateTime'];

  Map<String, dynamic> toJson() => {
        'index': index,
        'id': id,
        'url': url,
        'title': title,
        'updateTime': timeStamp,
        'timeStampCut': timeStampCut
      };
}

class NewsJsonData {
  List<NewsData> items;

  NewsJsonData.fromJson(List<Map> json) {
    var tmp = json;
    items = tmp.map((i) => NewsData.fromJson(i)).toList();
  }
}
