
import 'package:flutter/material.dart';



class ButtonStateShowDemo extends StatefulWidget {
  @override
  _ButtonStateShowDemoState createState() => _ButtonStateShowDemoState();
}

class _ButtonStateShowDemoState extends State<ButtonStateShowDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ong"),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: <Widget>[
              //文字的
              RaisedButton(
                onPressed:(){},
                child: Text('nomal'),
              ),

              FlatButton(onPressed: (){}, child: Text("nomal1")),

              OutlineButton(onPressed: (){},
                child: Text("nomal2"),
              ),

              //单图片的
              IconButton(icon: Icon(Icons.thumb_up), onPressed: (){}),

             //带图带文字的
              RaisedButton.icon(onPressed: (){}, icon: Icon(Icons.send), label: Text("show1")),

              FlatButton.icon(onPressed: (){}, icon: Icon(Icons.add), label: Text("show2")),

              OutlineButton.icon(onPressed: null, icon: Icon(Icons.info), label: Text("Show3")),

              //自定义的图片
              FlatButton(
                onPressed: (){},
                child: Text("one"),
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              ),

              //圆角widget 设置自定义水波纹颜色点击效果
              //https://blog.csdn.net/zl18603543572/article/details/95037826
              new Center(
                child: new Material(
                  child: new Ink(
                    //设置背景
                    decoration: new BoxDecoration(
                      color: Colors.purple,
                      borderRadius: new BorderRadius.all(new Radius.circular(30.0)),
                    ),
                    child: new InkResponse(
                      borderRadius: new BorderRadius.all(new Radius.circular(30.0)),
                      //点击或者toch控件高亮时显示的控件在控件上层,水波纹下层
                      highlightColor: Colors.purple[800],
                      //点击或者toch控件高亮的shape形状
                      highlightShape: BoxShape.rectangle,
                      //.InkResponse内部的radius这个需要注意的是，我们需要半径大于控件的宽，如果radius过小，显示的水波纹就是一个很小的圆，
                      //水波纹的半径
                      radius: 0.0,
                      //水波纹的颜色 设置了highlightColor属性后 splashColor将不起效果
                      splashColor: Colors.red,
                      //true表示要剪裁水波纹响应的界面   false不剪裁  如果控件是圆角不剪裁的话水波纹是矩形
                      containedInkWell: true,

                      onTap: () {
                        print('click');
                      },
                      child: new Container(
                        //不能在InkResponse的child容器内部设置装饰器颜色，否则会遮盖住水波纹颜色的，containedInkWell设置为false就能看到是否是遮盖了。
                        width: 300.0,
                        height: 50.0,
                        //设置child 居中
                        alignment: Alignment(0, 0),
                        child: Text("登录",style: TextStyle(color: Colors.white,fontSize: 16.0),),
                      ),
                    ),
                  ),
                ),
              ),





            ],
          ),
        ),
      ),
    );
  }
}










