import 'package:flutter/material.dart';



//////////测试写
class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key , this.title}) : super(key : key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter ++ ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),

            FlatButton(
              child: Text('open new route'),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NewRoute(text:'传输过去，点击');
                }));
              },
            ),

//          RaisedButton(child: Text("open route"),onPressed: () async {
//            //打开页面并等待返回的结果
//              var result = await Navigator.push(context,MaterialPageRoute(builder: (context){
//              return NewRoute( text:'我是提示语',);
//            }));
//            print("路由的返回值:$result");
//            },),

          ],
        ),
      ),


      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),

    );

  }
}

////////////////测试页面跳转写
class NewRoute extends StatelessWidget {
  final String text;
  NewRoute({Key key, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('New route'),
        ),
        body:Center(
          child: Column(
            children: <Widget>[
              Text(text,style: Theme.of(context).textTheme.headline3),

              FlatButton( child: Text('点击返回',style:TextStyle(color: Colors.amberAccent,)),onPressed: (){
                Navigator.pop(context,'我是返回值');
              }),
            ],
          ),
        )
    );
  }
}
