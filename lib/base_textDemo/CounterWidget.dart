

import 'package:flutter/material.dart';


class CounterWidget extends StatefulWidget {

  final int initValue;
  final String title;

  const CounterWidget({Key key,
    this.initValue = 0,
    this.title}) : super(key: key);

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {

  int _counter;

  @override
  void initState() {
    // 初始化状态
    super.initState();
    _counter = widget.initValue;
    print('----initState---');
  }


  //
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies");
  }


  @override
  Widget build(BuildContext context) {
    print('build');

    return Scaffold(
      appBar: new AppBar(
        title:Text(widget.title),
      ),
      
      body:Container(
        margin: EdgeInsets.only(top: 100),
        child:  Center(
          child: Column(
            children: <Widget>[

              FlatButton(onPressed: (){
                setState(() {
                  ++ _counter;
                });
              }, child: Text('点击显示数字+ = $_counter')),

              FlatButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('点击退出'),color: Colors.amber,),

            ],
          ),
        ),
      ),
    );
  }

  //
  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    //只要在父widget中调用setState，子widget的didUpdateWidget就一定会被调用，不管父widget传递给子widget构造方法的参数有没有改变。
    print("didUpdateWidget");
  }

  //
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("deactivate");
  }

  //
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose");
  }

  //
  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print("reassemble");
  }







}






