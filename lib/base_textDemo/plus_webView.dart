
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


class LoadWebViewPage extends StatefulWidget {
  @override
  _LoadWebViewPageState createState() => _LoadWebViewPageState();
}

class _LoadWebViewPageState extends State<LoadWebViewPage> {

  var title = "WebView组件";
  bool _oneBool = true;
  //获取h5页面标题
  Future<String> getWebTitle() async {
    String script = 'window.document.title';
    var title = await
    flutterWebviewPlugin.evalJavascript(script);
    setState(() {
      this.title = title;
      print('####################   $title');
    });
  }


  void initState() {
    super.initState();

    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      switch (state.type) {
        case WebViewState.shouldStart:
        //准备加载
          break;
        case WebViewState.startLoad:
        //开始加载
          break;
        case WebViewState.finishLoad:
          getWebTitle();
        //加载完成
          break;
        case WebViewState.abortLoad:
          break;
      }
    });
  }


  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();

  @override
  void dispose() {
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop(){

    Future<bool>canGoBack = flutterWebviewPlugin.canGoBack();
    canGoBack.then((value){
      if(value){
        flutterWebviewPlugin.goBack();
      }else{
        Navigator.of(context).pop(true);
      }
    });
   }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: WebviewScaffold(

        appBar: AppBar(
          title: Text(title),
//          leading: GestureDetector(
//            child: Icon(Icons.arrow_back),
//            onTap:(){
//              flutterWebviewPlugin.close();
//            },
//          ),
        ),
        url:"https://blog.csdn.net/dickyqie",
        //显示环形进度条，如果设置了initialChild则不显示系统进度条
        hidden: true,
        withJavascript: true,
        withZoom: true, //网页缩放
        withLocalStorage: true,
        initialChild: Container(
          color: Colors.white,
          child: Center(
            child: Text("页面加载中....."),
          ),
        ),
      ),);
  }



//  Future<bool>_onWillPop(){
//    return showDialog(
//        context: context,
//        builder:(context) => new AlertDialog(
//          title: Text("Are you sure?"),
//          content: Text("Do you want to exit on app"),
//          actions: <Widget>[
//            FlatButton(onPressed: () => Navigator.of(context).pop(false),
//                child: Text("No"),),
//            FlatButton(onPressed: () =>Navigator.of(context).pop(true),
//                child: Text("yes"),),
//          ],
//
//        ),
//    ) ?? false ;
//  }

}



