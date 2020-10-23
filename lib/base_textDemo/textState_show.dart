

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class TextShowType extends StatefulWidget {
  @override
  _TextShowTypeState createState() => _TextShowTypeState();
}

class _TextShowTypeState extends State<TextShowType> {

  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();

  void _tapRecognizer(){
    print("one-one");
  }

  //
  @override
  void dispose() {
    // TODO: implement dispose
   //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('text-Show'),),
      body: Container(

        margin: EdgeInsets.only(top: 100),

        child: Column(
          children: <Widget>[

            Text('Hello world,Hello world',textAlign: TextAlign.left,),

            Text('hello world! how are you' *4,maxLines: 1,overflow: TextOverflow.ellipsis,),

            Text('hello world',textScaleFactor: 1.5,),

            Text('hello hello',style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                height: 1.2,
                fontFamily: 'Courier',
                decoration: TextDecoration.underline,
                background: Paint()..color = Colors.yellow,
                decorationStyle: TextDecorationStyle.dashed,
              ),
            ),

            Text.rich(TextSpan(

              children: [
                TextSpan(
                  text: "Home : ",
                ),

                TextSpan(
                  text:"http:www.baidu.com",
                  style: TextStyle(color: Colors.blue),
                  recognizer: _tapGestureRecognizer..onTap = (){
                    setState(() {
                        print('object');
                    });
                  },

//                  recognizer: TapGestureRecognizer()..onTap = (){
//                    _tapRecognizer();
////                     setState(() {
////                         print('object');
////                     });
//                  },

                ),
              ],
            )),


          ],
        ),
      ),
    );
  }
}
