import 'package:flutter/material.dart';

//设置光标移动到后面，初始化的时候光标保持在文字最后
//https://blog.csdn.net/zl18603543572/article/details/103773297


//FocusTestRoute


//textFiled 的控制焦点的练习 FousNode

class FocusTestRoute extends StatefulWidget {
  @override
  _FocusTestRouteState createState() => _FocusTestRouteState();
}

class _FocusTestRouteState extends State<FocusTestRoute> {


  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("焦点控制")),
      body: Padding(
        padding: EdgeInsets.all(16.0),

        child: Column(
          children: <Widget>[

            TextField(
              autofocus: true,
              focusNode: focusNode1, //关联focusNode1
              decoration: InputDecoration(
                labelText: "input1",
                labelStyle: TextStyle(color: Colors.red,fontSize: 17),
                //未获取焦点事件下划线设为灰色
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                //获得焦点下划线设为蓝色
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),

            ),

            TextField(
              focusNode: focusNode2, //关联focusNode
              decoration: InputDecoration(
                labelText: "input2",
//                //未获取焦点事件下划线设为灰色
//                enabledBorder: UnderlineInputBorder(
//                  borderSide: BorderSide(color: Colors.grey),
//                ),
//                //获得焦点下划线设为蓝色
//                focusedBorder: UnderlineInputBorder(
//                  borderSide: BorderSide(color: Colors.blue),
//                ),
              ),
            ),

            Builder(builder: (context) {
              return Column(
                 children: <Widget>[

                   RaisedButton(onPressed: (){

                     if(null == focusScopeNode){
                       focusScopeNode = FocusScope.of(context);
                     }
                       focusScopeNode.requestFocus(focusNode2);
                   },
                     child: Text("移动焦点"),
                   ),


                   RaisedButton(child: Text("隐藏键盘"),
                     onPressed: (){
                       focusNode1.unfocus();
                       focusNode2.unfocus();
                     },
                   ),

                 ],

              );

            },),

          ],
        ),
      ),

    );
  }
}



//textField 的基础练习
class TextFieldAndFormState extends StatefulWidget {
  @override
  _TextFieldAndFormStateState createState() => _TextFieldAndFormStateState();
}

class _TextFieldAndFormStateState extends State<TextFieldAndFormState> {


  String _tfName  = "";

  TextEditingController _unameController = TextEditingController();
  
  //contriller监听输入
  @override
  void initState() {

    _unameController.addListener(() {
      print(_unameController.text);
    });

    _unameController.text = "hello world";
    _unameController.selection = TextSelection(
        baseOffset: 3, //默认选中文本开始位置
        extentOffset: _unameController.text.length-2, //默认选中文本结束位置
    );

  }
  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title:Text("textFiledAndForm"),),
     body: Container(
       child: Column(
         children: <Widget>[

           //
           TextField(
             autofocus: true,
             decoration: InputDecoration(
               hintText: "用户名或者邮箱",
               labelText: "用户名",
               prefixIcon: Icon(Icons.person),
             ),

             controller: _unameController,

//             onChanged: (value){
//                _tfName = value;
//             },
           ),

//           print(_unameController.text);


           TextField(
             decoration: InputDecoration(
               labelText: "密码",
               hintText: "请输入您的密码",
               prefixIcon: Icon(Icons.lock),
             ),
           ),






         ],
       ),
     ),
   );

  }
}
