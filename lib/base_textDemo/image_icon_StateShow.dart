
import 'dart:ui';

import 'package:flutter/material.dart';



class ImageIconStateShow extends StatefulWidget {
  @override
  _ImageIconStateShowState createState() => _ImageIconStateShowState();
}

class _ImageIconStateShowState extends State<ImageIconStateShow> {
  @override
  Widget build(BuildContext context) {

    String icons = "";

    icons += "\uE914";

    icons += " \uE000";

    icons += " \uE90D";



    return Scaffold(
      appBar: AppBar(title: Text('ImageAndIcon')),

      body: Center(
        child: Column(
          children: <Widget>[
            //图片
            Image(
              image: AssetImage("images/mineTabBar_nomal@3x.png"),
              width: 25,
              height: 25,
            ),

            Image.asset('images/mineTabbar_Select@3x.png',width: 100,),


            //
            Image(image: NetworkImage("https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),width: 100,),

            Image.network(
              "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
              width: 200,
              height: 200,
              fit: BoxFit.fill,
//              color: Colors.red,
//              colorBlendMode: BlendMode.difference,
            ),


            Text(icons,
              style: TextStyle(fontFamily: "MaterialIcons",fontSize: 24.0,color: Colors.green),
            ),


            Icon(Icons.accessible,color: Colors.green,),
            Icon(Icons.error,color: Colors.green,),




          ],
        ),
      ),

    );
  }
}


//图片官网
class ImageAndIconRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var img=AssetImage("images/mineTabBar_nomal@3x.png");
    return SingleChildScrollView(
      child: Column(
          children: <Image>[
            Image(
              image: img,
              height: 25.0,
              width: 25.0,
              fit: BoxFit.fill,
            ),
            Image(
              image: img,
              height: 25.0,
              width: 25.0,
              fit: BoxFit.contain,
            ),
            Image(
              image: img,
              width: 50.0,
              height: 25.0,
              fit: BoxFit.cover,
            ),
            Image(
              image: img,
              width: 50.0,
              height: 25.0,
              fit: BoxFit.fitWidth,
            ),
            Image(
              image: img,
              width: 50.0,
              height: 25.0,
              fit: BoxFit.fitHeight,
            ),
            Image(
              image: img,
              width: 50.0,
              height: 25.0,
              fit: BoxFit.scaleDown,
            ),
            Image(
              image: img,
              height: 50.0,
              width: 50.0,
              fit: BoxFit.none,
            ),
            Image(
              image: img,
              width: 50.0
            ),
            Image(
              image: img,
              width: 50.0,
              height: 50.0,
              repeat: ImageRepeat.repeatY ,
            ),
            Image(
                image: img,
                width: 50.0
            ),
            Image(
                image: img,
                width: 50.0
            ),
            Image(
                image: img,
                width: 50.0
            ),
            Image(
                image: img,
                width: 50.0
            ),
            Image(
                image: img,
                width: 50.0
            ),
            Image(
                image: img,
                width: 50.0
            ),
          ].map((e){
            return Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: 50,
                    child: e,
                  ),
                ),
                Text("one")
              ],
            );
          }).toList()
      ),
    );
  }
}