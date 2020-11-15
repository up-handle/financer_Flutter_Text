

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'base_textDemo/stateShow_page.dart';
import 'base_textDemo/CounterWidget.dart';
import 'base_textDemo/text_jumpPass_value.dart';
import 'base_textDemo/ParentWidgetC.dart';
import 'base_textDemo/textState_show.dart';
import 'base_textDemo/buttonState_Show.dart';
import 'base_textDemo/image_icon_StateShow.dart';
import 'base_textDemo/switch_checkbox_stateShow.dart';
import 'base_textDemo/textFiled_Form_state.dart';
import 'base_textDemo/button_disabled_show.dart';
//
import 'login_pageDemo/loginPage_show.dart';
import 'login_pageDemo/homa_pageShow.dart';

import 'login_pageDemo/enter_state.dart';

import 'cycle_banner_flie/carousel_page.dart';
import 'base_textDemo/plus_webView.dart';
import 'base_textDemo/InheritedWidget_text.dart';
import 'base_textDemo/provider_text.dart';
import 'base_textDemo/DropButtonShow.dart';
import 'base_textDemo/linkageView_widget.dart';

import 'flutterTextPack/study_text1.dart';

/**
 * 想要自动错误填充  option + shit + 回车
 * 想要自动格式化代码  option + command + L
 * command  +  (+ / - ) 折叠和展开
 */


/**
 * 持久化的练习 https://my.oschina.net/u/3647851/blog/1791974
 * InheritedWidget的使用  https://www.jianshu.com/p/387e2454d590
 */


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

//    return Enter();


    return MaterialApp(
      title:'flutter Demo',
      debugShowCheckedModeBanner:false,
      theme: new ThemeData(
        primarySwatch: Colors.lightBlue,
        brightness: Brightness.dark, //应用程序整体主题亮度。由按钮widget使用，确定在不使用主题色的时间选择颜色
        accentColor: Colors.cyan, //前景色(文本 按钮)
      ),
        //基础练习
        home: ShowAllControllerList(),
//        home: LoginShowPageVC(),
    );

  }
}


class ShowAllControllerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("总述"),),
      body: ListView.builder(
        //shrinkWrap: true,
        //physics: NeverScrollableScrollPhysics(),
        itemCount:list.length,
        itemBuilder: (context, position){
          return Container(
            child:  ListTile(
              title: Text(list[position].name),
              onTap: (){
                if(list[position].name != ""){
                  Navigator.push(context, MaterialPageRoute(builder: list[position].builder));
                }
              },),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 1,color: Color(0xffe5e5e5))),
            ),
          );
        },
      ),
    );
  }
}


class _RouterInfo {
  String name;
  WidgetBuilder builder;
  _RouterInfo({this.name,this.builder});
}

final List<_RouterInfo> list = <_RouterInfo> [

  _RouterInfo(name: "flutterStudyText1",builder: (context)=>StudyFlutterText1()),
  _RouterInfo(name: "",builder: (context)=>Container()),
  _RouterInfo(name: "跨组件状态共享Provider",builder: (context) => InheritedWidgetTestRoute()),
  _RouterInfo(name: "InheritedWidget的测试",builder: (context) => InheritedWidgetTestRoute()),
  _RouterInfo(name: "加载webView的willPopScope",builder: (context) => LoadWebViewPage()),
  _RouterInfo(name: "页面展示周期",builder: (context) => CounterWidget(title: "页面周期") ),
  _RouterInfo(name: "测试跳转页面",builder: (context) => MyHomePage(title: "页面跳转",) ),
  _RouterInfo(name: "状态的变更",builder: (context) => StateShowPage(titleKey: "状态展示",) ),
  _RouterInfo(name: "混合状态的变更",builder: (context) => ParentWidgetC() ),
  _RouterInfo(name: "开关switch和checkBox",builder: (context) => SwitchAndCheckBoxTestRoute() ),
  _RouterInfo(name: "button的展示",builder: (context) => ButtonStateShowDemo() ),
  _RouterInfo(name: "textField的基础练习",builder: (context) => TextFieldAndFormState()),
  _RouterInfo(name: "textField的焦点练习",builder: (context) => FocusTestRoute()),
  _RouterInfo(name: "文本展示练习",builder: (context) => TextShowType()),
  _RouterInfo(name: "图片和图标展示练习",builder: (context) => ImageIconStateShow()),
  _RouterInfo(name: "button禁用和点击处理",builder: (context) => ButtonDisableShowPage()),
  _RouterInfo(name: "封装轮播图实现",builder: (context) => CarouselPage()),
  _RouterInfo(name: "加载webView的实现",builder: (context) => LoadWebViewPage()),
  _RouterInfo(name: "弹出Pop的button",builder: (context)=>MyStatefulWidget()),
  _RouterInfo(name: "View联动分类展示",builder: (context)=>LinkageViewWidget()),



];







