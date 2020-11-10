
import 'package:flutter/material.dart';

//本类
class LinkageViewWidget extends StatefulWidget {
  @override
  _LinkageViewWidgetState createState() => _LinkageViewWidgetState();
}

class _LinkageViewWidgetState extends State<LinkageViewWidget> {


  final _goodsList = [
    {"title": "精选特卖",
      "list": ["毛肚","甜点组合", "毛肚", "菌汤", "甜点组合", "毛肚", "菌汤", "甜点组合", "菌汤"]
    },
    {"title": "饭后(含有茶点)",
      "list": ["甜点组合", "毛肚", "菌汤"]
    },
    {"title": "茶点(含有茶点)",
      "list": ["米其林","甜点组合", "毛肚", "菌汤", "甜点组合", "毛肚", "菌汤"]
    },
    {"title": "素材水果拼盘",
      "list": [
        "水果", "甜点组合", "毛肚", "菌汤", "甜点组合", "毛肚", "菌汤",
      ],
    },
    {"title": "水果拼盘生鲜果",
      "list": ["甜点组合", "毛肚", "菌汤",]
    },
    {"title": "拼盘",
      "list": ["组合拼盘"]
    },
    {"title": "烤鱼盘",
      "list": ["烤鱼盘组合", "毛肚", "菌汤", "甜点组合", "毛肚", "菌汤"]
    },
    {"title": "饮料",
      "list": [
        "甜点组合", "毛肚", "菌汤", "甜点组合", "毛肚", "菌汤", "甜点组合", "毛肚", "菌汤"
      ]
    },
    {"title": "小吃",
      "list": ["甜点组合", "毛肚"]
    },
    {"title": "作料",
      "list": ["甜点组合", "毛肚", "菌汤"]
    },
    {"title": "主食",
      "list": ["米饭", "馒头"]
    },
  ];

  var _selectBigItem = "精选特卖";

  final GlobalKey<_rightCategoryDataViewState> categoryKey = GlobalKey();

  void _leftSelectCallBack(String value){
    print("1------------->" + value);
    _selectBigItem = value;
    categoryKey.currentState.changeState(value);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("联动View"),
      ),
      body: Container(
        color: Colors.grey,
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.only(top: 200),
          child: Row(
            children: <Widget>[
              //左边选择View
              LeftBigDataView(allDataList: _goodsList,callBack:_leftSelectCallBack,),
              //中间
              Container(width: 10,),
              //右边的category的view
              rightCategoryDataView(allDataList: _goodsList,selectBigItem:_selectBigItem,key: categoryKey,),
            ],
          ),
        )
      ),
    );
  }
}


//////左边的大数据集合
class LeftBigDataView extends StatefulWidget {

  final List allDataList;
  final ValueChanged<String> callBack;
  const LeftBigDataView({Key key, this.allDataList,this.callBack}) : super(key: key);

  @override
  _LeftBigDataViewState createState() => _LeftBigDataViewState();
}

class _LeftBigDataViewState extends State<LeftBigDataView> {

  final List<String> showDataList = List();

  @override
  void initState() {
    // TODO: implement initState
    widget.allDataList.forEach((element) {
      String title = element["title"];
      showDataList.add(title);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; //获取当前context的宽度和高度
    return Container(
      margin: EdgeInsets.only(left: 20),
      width: 130,
      height: size.height,
      color: Colors.white,
      child: ListView.builder(
        itemBuilder:(context,index){
          return RaisedButton(onPressed:(){
            widget.callBack(showDataList[index]);
          }, child: Text(showDataList[index]),);
        },
        itemCount: showDataList.length,
      ),
    );
  }
}


//////右边分类的数据集合
class rightCategoryDataView extends StatefulWidget {

  final List allDataList;
  final String selectBigItem;
  const rightCategoryDataView({Key key, this.allDataList, this.selectBigItem}) : super(key: key);

  @override
  _rightCategoryDataViewState createState() => _rightCategoryDataViewState();
}

class _rightCategoryDataViewState extends State<rightCategoryDataView> {

  List<String> selectCategoryList = [];
  final controller = new ScrollController();
  var selectString;
  @override
  void initState() {
    // TODO: implement initState
    selectString = widget.selectBigItem;
    widget.allDataList.forEach((element) {
      if(element["title"] == selectString ){
         selectCategoryList = element["list"];
      }
    });
    super.initState();
  }

  changeState(String selectString) {
    selectString = selectString;
    this.controller.animateTo(0, duration: Duration(milliseconds: 100), curve: Curves.bounceIn);
    widget.allDataList.forEach((element) {
      if(element["title"] == selectString ){
        selectCategoryList = element["list"];
      }
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width-220,
      height: size.height,
      color: Colors.white,
      child: ListView.builder(
        controller: controller,
        itemBuilder:(context,index){

          return RaisedButton(onPressed:(){

            print("----选择bigItem---" + selectString);
            print("----选择分类目标---" + selectCategoryList[index]);

          },child: Text(selectCategoryList[index]),);
        },
        itemCount: selectCategoryList.length,
      ),
    );
  }
}






