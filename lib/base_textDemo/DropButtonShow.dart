import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = '请选择';
  String isChapterValue = '请选择';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("选择button"),
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            DropdownButton<String>(
              value: dropdownValue,
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                  isChapterValue = _ChapterNameList[dropdownValue][0]['title']; //二级
                });
              },
              items: _listItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            DropdownButton<String>(
              value: isChapterValue,
              onChanged: (String newValue) {
                isChapterValue = newValue;
                //选择后打印值
                print(dropdownValue);
                print(isChapterValue);
              },
              items: _ChapterNameList[dropdownValue].map((item) {
                return DropdownMenuItem<String>(
                  value: item['title'],
                  child: Text(item['title']),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
  // 数据源
  List<String> _listItems = <String>[
    '请选择',
    '水果',
    '蔬菜',
    '肉类',
  ];
  var _ChapterNameList = {
    '请选择':[
      { "title": "请选择"},
     ],
    '水果' : [
      { "title": "苹果"},
      { "title": "香蕉"},
      { "title": "火龙果"},
      { "title": "猕猴桃"},
      { "title": "梨"},
    ],
    '蔬菜': [
      { "title": "空心菜"},
      { "title": "菠菜"},
      { "title": "黄瓜"},
      { "title": "花菜"},
      { "title": "荠荠菜"},
    ],
    '肉类':[
      { "title": "牛肉"},
      { "title": "鸡肉"},
      { "title": "鸭肉"},
      { "title": "鹅肉"},
      { "title": "猪肉"},
    ],
  };

}


