class RssData {
  final String url;
  final String title;
  final String timeStamp;
  final int id;
  int index;
  String timeStampCut;

  RssData.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        url = json['url'],
        title = json['title'],
        timeStamp = json['date_modified'];

  Map<String, dynamic> toJson() => {
        'index': index,
        'id': id,
        'url': url,
        'title': title,
        'date_modified': timeStamp,
        'timeStampCut': timeStampCut
      };
}

class RssJsonData {
  String version;
  String title;
  String home_page_url;
  String feed_url;
  String description;
  List<RssData> items;

  RssJsonData.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    title = json['title'];
    home_page_url = json['home_page_url'];
    feed_url = json['feed_url'];
    description = json['description'];
    var tmp = json['items'] as List;
    items = tmp.map((i) => RssData.fromJson(i)).toList();
  }

  Map<String, dynamic> toJson() => {
        'version': version,
        'title': title,
        'home_page_url': home_page_url,
        'feed_url': feed_url,
        'description': description,
        'items': items,
      };
}
