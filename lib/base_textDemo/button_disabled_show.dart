import 'package:flutter/material.dart';

class ButtonDisableShowPage extends StatefulWidget {
  @override
  _ButtonDisableShowPageState createState() => _ButtonDisableShowPageState();
}

class _ButtonDisableShowPageState extends State<ButtonDisableShowPage> {
  bool _isButtonDisabled;
  int _counter = 1;

  GlobalKey<ScaffoldState> _key;

  @override
  void initState() {
    _isButtonDisabled = false;
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    _key = GlobalKey<ScaffoldState>();
      return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text("text app"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _buildButtons(),
        ),
      ),
    );
  }

  List<Widget> _buildButtons(){

    List<Widget> list = [
      _buildButton1(_counter),
      _buildSpaceView(20.0),
      _buildButton2(),
    ];
    return list;
  }

  RaisedButton _buildButton2(){
    return RaisedButton(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      child: new Text(
        'click me',
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.white,
        ),
      ),
      color: Theme.of(context).accentColor,
      elevation: 4.0,
      splashColor: Colors.blueGrey,
      onPressed: _getBtn2ClickListener(),
    );
  }

  Widget _buildSpaceView(double _height){
    return new Container(height: _height,);
  }

  RaisedButton _buildButton1(int counter) {
    return RaisedButton(
      padding: new EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
      child: new Text(
        'count:'+ counter.toString(),
        style: TextStyle(fontSize: 18.0,color: Colors.white,),
      ),
      color: Theme.of(context).accentColor,
      elevation: 4.0,
      //shadow
      splashColor: Colors.blueGrey,
      onPressed: _getBtn1ClickListener(),
    );
  }

  _getBtn1ClickListener() {
    if (_isButtonDisabled) {
      return null;
    } else {
      return (){
        _key.currentState.showSnackBar(new SnackBar(
            content: Text('Hello world!'),
        ));
      };
    }
  }

  _getBtn2ClickListener(){
    return (){
      _incrementCounter();
    };
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter % 2 == 0) {
        _isButtonDisabled = true;
      } else {
        _isButtonDisabled = false;
      }
    });
  }


}
