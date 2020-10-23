import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'enter_state.dart';
class HomePageShowView extends StatefulWidget {
  @override
  _HomePageShowViewState createState() => _HomePageShowViewState();
}

class _HomePageShowViewState extends State<HomePageShowView> {

  void _incrementBackUserName() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userName', "");
    Navigator.of(context).pushAndRemoveUntil(
        new MaterialPageRoute(builder: (context) => new Enter()
        ), (route) => route == null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("首页"),),
      body: Container(
        width:  MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.red,
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed:(){
                print("点击了退出登录");
                _incrementBackUserName();
              },
              child: Text("退出登录",style: TextStyle(fontSize: 20,color: Colors.green),),),
          ],
        ),
      ),
    );
  }
}



