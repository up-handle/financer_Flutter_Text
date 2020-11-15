
import 'dart:core';

import 'package:flutter/material.dart';


///引用库
/**
 *指定一个库的前缀
 库的引用  如果两个库里面同时都有 Element这类 则使用as 来指定哪个
    Element elment = Element();
    lib2.Element element = new lib2.Element();

 * import 'package:lib1/lib1.dart';
 * import 'package:lib2/lib2.dart' as lib2;
 */

/**
 * 引用库的一部分
 * 如果只需要引用库的一部分内容，可以有选择地引用，有如下关键字：
 * show 关键字：只引用一点
 * hide 关键字：除此之外都引用
 *
 * import 'package:lib2/lib2.dart' show foo;
 * import 'package:lib2/lib2.dart' hide foo;
 */




/// 学习flutter中Theme主题的更改

class StudyFlutterText1 extends StatefulWidget {
  @override
  _StudyFlutterText1State createState() => _StudyFlutterText1State();
}

class _StudyFlutterText1State extends State<StudyFlutterText1> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      // set / get  练习
//    rectTextToShow();
    // 重载操作练习
//    textBeginLoadMethod();
    //继承、混入、接口实现
//    textStudyExtends();
    //抽象
    testAbstractText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("one"),
      ),
      body: Column(
        children: <Widget>[
          //主题
          Container(
            child: Theme(data: ThemeData(
              accentColor: Colors.yellow,
            ),
                child:FloatingActionButton(
                  onPressed: (){},
                  child: Icon(Icons.add),
                )),
          ),
          Container(
            child: Theme(
              data: Theme.of(context).copyWith(accentColor: Colors.red),
              child: RaisedButton(onPressed: (){},child: Text("two",style: TextStyle(fontSize: 20),),),
            ),
          ),
          Container(
            color: Theme.of(context).accentColor,
            child:Text("three"),
          ),
        ],
      )
    );
  }
}


/// set / get  练习

void rectTextToShow(){

    var rect = Rectangle(3,  4 , 20, 15);
    print('left:' + rect.left.toString());
    print('right:' + rect.right.toString());
    rect.right = 30;
    print("更改right值为30");
    print('left:' + rect.left.toString());
    print('right:' + rect.right.toString());

    print('top:' + rect.top.toString());
    print('bottom:' + rect.bottom.toString());
    rect.bottom = 50;
    print("更改buttom值为50");
    print('top:' + rect.top.toString());
    print('bottom:' + rect.bottom.toString());
}

class Rectangle {
  num left;
  num top;
  num width;
  num height;
  //构造函数
  Rectangle(this.left,this.top,this.width,this.height);
  //set / get
  num get right => left + width;
  set right(num value) => left= value-width;

  num get bottom  =>top + height;
  set bottom(num value) => top = value - height;
}

/// 重载操作练习
void textBeginLoadMethod(){
  final v = new Vector(2, 3);
  final w = new Vector(2, 2);

  final r1 = v + w;
  print('r1.x = '+r1.x.toString() + ' r1.y = '+r1.y.toString() );

  final r2 = v - w;
  print("r2.x = " + r2.x.toString() + ' r2.y = ' + r2.y.toString() );
}

class Vector {
  final int x ;
  final int y;
  const Vector(this.x,this.y);

  //重载加号 + （a+b）
  Vector operator + (Vector v){
    return Vector(x + v.x , y + v.y);
  }
  //重载加号 - （a+b）
  Vector operator - (Vector v){
    return Vector(x - v.x , y - v.y);
  }

}

///继承类 和 混合 minix(with关键字)的使用 和 接口实现implements

//implements
/**
 * implements
 * Flutter是没有interface的，但是Flutter中的每个类都是一个隐式的接口，这个接口包含类里的所有成员变量，以及定义的方法。
 * 如果有一个类 A,你想让类B拥有A的API，但又不想拥有A里的实现，那么你就应该把A当做接口，类B implements 类A.
 * class 就是 interface
    当class被当做interface用时，class中的方法就是接口的方法，需要在子类里重新实现，在子类实现的时候要加@override
    当class被当做interface用时，class中的成员变量也需要在子类里重新实现。在成员变量前加@override
    实现接口可以有多个
 * */

class Carton {
  String cartonName = "carton";
  void playCarton(){
    print("object--playCarton");
  }
}

class Movie{
  void playMovie(){
    print("object--playMovie");
  }
}


//with 实现混入 Mixins 相当于多继承
/**
 * 混合的对象是类
 * 可以混合多个
 * */
class fishClass{
  void fishSkill() { print("会学游泳"); }
}
class birdClass{
  void birdSkill() { print('学鸟会飞'); }
}

//继承
class Animal{
  void eat() { print("动物会吃"); }
  void run() { print('动物会跑'); }
}


class Human extends Animal with fishClass,birdClass implements Carton,Movie{

  void say(){ print("人类会说"); }

  void study(){
    print("人类会学");
    fishSkill();
    birdSkill();
  }

  @override
  String cartonName = "implements重新实现的类实例对象--cartonName";

  @override
  void playCarton() {
    // TODO: implement playCarton
    print('implements--playCarton');
  }

  @override
  void playMovie() {
    // TODO: implement playMovie
    print('implements--playMovie');
  }


}

void textStudyExtends(){
  print("实例化一个动物类");
  var animal = new Animal();
  animal.eat();
  animal.run();

  print("实例化一个人类");
  var human = new Human();
  human.say();
  human.study();

  //implement 来接口实现
  print(human.cartonName);
  human.playCarton();
  human.playMovie();

}

///抽象类的实现--->abstract
///抽象类不实现具体的方法，只是定义好接口，具体的时实现留给调用的人去实现。
///抽象类可以使用abstract来实现
///定义一个抽象类叫做DataBaseOperate 里面定义4个数据库的经常操作方法，增删改查。
///再定义一个类继承这个抽象类来实现抽象类里面的方法

abstract class DataBaseOperate {
  void insert();
  void delete();
  void update();
  void query();
}

class DateBaseOperateImpl extends DataBaseOperate {

  void insert(){
    print('实现了插入方法');
  }
  void delete(){
    print('实现了删除方法');
  }
  void update(){
    print('实现了更新方法');
  }
  void query(){
    print('实现了查询的方法');
  }
}

//抽象类实现
void testAbstractText(){
  var db = DateBaseOperateImpl();
  db.insert();
  db.delete();
  db.update();
  db.query();
}
