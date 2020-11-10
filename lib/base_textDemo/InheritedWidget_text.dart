
import 'package:flutter/material.dart';


/**
 *
 * 数据共享
 *
inheritedWidget是Flutter的重要的功能组件，
    它提供了一种数据在widget树中从上到下传递、共享的方式，
    比如我们在应用的根widget中通过InheritedWidget共享了一个数据，那么我们便可以在任意子widget中来获取该共享的数据！
    这个特性在一些需要在widget树中共享数据的场景中非常方便！如Flutter SDK中正是通过InheritedWidget来共享应用主题（Theme）和Locale (当前语言环境)信息的。
*/


//我们通过继承InheritedWidget，将当前计数器点击次数保存在ShareDataWidget的data属性中
class ShareDataWidget extends InheritedWidget{

  final int data; //需要在子树中共享的数据，保存点击次数
  ShareDataWidget({
    this.data,
    Widget child
  }):super(child:child);

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  }
  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget
   @override
   bool updateShouldNotify(ShareDataWidget oldWidget) {
     return oldWidget.data != data ;
   }

}

//实现一个子组件_TestWidget，在其build方法中引用ShareDataWidget中的数据。同时，在其didChangeDependencies() 回调中打印日志
class _Testwidget extends StatefulWidget {
  @override
  __TestwidgetState createState() => __TestwidgetState();
}

class __TestwidgetState extends State<_Testwidget> {
  @override
  Widget build(BuildContext context) {

    //使用InheritedWidget中的共享数据
    var _inheritedStr = ShareDataWidget.of(context).data.toString();
    return Container(
      color: Colors.white,
      child: Text(_inheritedStr,style: TextStyle(fontSize: 40),),
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("dependencies Change");
  }

}

//我们创建一个按钮，每点击一次，就将ShareDataWidget的值自增

class InheritedWidgetTestRoute extends StatefulWidget {
  @override
  _InheritedWidgetTestRouteState createState() => _InheritedWidgetTestRouteState();
}

class _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {

  int count = 0;

  @override
  Widget build(BuildContext context) {

     return Scaffold(
       appBar: AppBar(
         title: Text("InheritedWidget"),
       ),
       body:  Container(
         color: Colors.white,
         child: Center(
           child: ShareDataWidget(
             data: count,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Padding(
                   padding: const EdgeInsets.only(bottom: 20.0),
                   child: _Testwidget(), //子widget中依赖ShareDataWidget
                 ),
                 RaisedButton(
                   child: Text("Increment"),
                   onPressed: () => setState(() => ++count ),
                 ),
                 SizedBox(height: 20,),
                 RaisedButton(
                   child: Text("reset"),
                   onPressed: () => setState(() => count=0),
                 ),

               ],

             ),
           ),
         ),
       ),
     );
  }
}



