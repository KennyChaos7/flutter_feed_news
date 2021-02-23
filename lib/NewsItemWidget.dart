import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/NewsData.dart';

class NewsItemWidget extends StatelessWidget {
  NewsData newsData;
  GestureTapCallback onPressed;

  NewsItemWidget(NewsData newsData, GestureTapCallback onPressed) {
    this.newsData = newsData;
    this.onPressed = onPressed;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // Padding 控件
        Padding(
          // 上下左右边距均为 10
          padding: EdgeInsets.all(10),
          child: Text("${newsData.index}."),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width - 50,
          child: Card(
            elevation: 13.0, //设置阴影
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(14.0))), //设置圆角
            child: new Column(
              children: [
                new ListTile(
                  title: new Text(
                    newsData.title.trim(),
                    softWrap: true,
                    style: TextStyle(fontSize: 18),
                  ),
                  onTap: onPressed,
                )
              ],
            ),
          ),
        )
        // Padding(
        //   // Padding 控件，用来设置 FlatButton 内边距
        //   // 右边距为 10，其余均为 0
        //   padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
        //   child: Text(
        //     // 按钮背景颜色
        //     color: Color(0xFFF1F0F7),
        //     // 按钮点击后颜色
        //     highlightColor: Colors.blue[700],
        //     // 按钮主题
        //     colorBrightness: Brightness.dark,
        //     child: Text(
        //       "安装",
        //       style: TextStyle(
        //           // 字体颜色
        //           color: Color(0xFF007AFE),
        //           // 字体加粗
        //           fontWeight: FontWeight.bold),
        //     ),
        //     shape: RoundedRectangleBorder(
        //         // 按钮加圆角
        //         borderRadius: BorderRadius.circular(20.0)),
        //   ),
        // ),
      ],
    );
  }
}
