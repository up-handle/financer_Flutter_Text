import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loginPage_show.dart';

import 'homa_pageShow.dart';



class Enter extends StatefulWidget {
  @override
  _EnterState createState() => _EnterState();
}

class _EnterState extends State<Enter> {


  Widget homePage = new Container(color: Colors.white,);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //获取显示的页面
    mainPage();
  }

  Future <String> getUserName() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userName = prefs.getString("userName") ?? "";
    return userName;
  }

  mainPage() async{
    String userNameStr = await getUserName();

    setState(() {

      if(userNameStr.length >0 ){
        homePage = HomePageShowView();
      }else{
        homePage = LoginShowPageVC();
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'flutter Demo',
      debugShowCheckedModeBanner:false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: homePage,

    );
  }







}
