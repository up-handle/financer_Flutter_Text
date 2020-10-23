
import 'package:flutter/material.dart';



class StateShowPage extends StatefulWidget {

  final String titleKey;
  const StateShowPage({Key key, this.titleKey}) : super(key: key);

  @override
  _StateShowPageState createState() => _StateShowPageState();
}

class _StateShowPageState extends State<StateShowPage> {

  bool _active = false;

  void _handleTapboxChanged(bool newValue){
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('one')),
        body: Container(
          color: Colors.white,
          child: TabboxB(
            active: _active,
            onChanged: _handleTapboxChanged,
          ),
        ),
    );
  }
}
//////////////
class TabboxB extends StatelessWidget {

  final bool active;
  final ValueChanged<bool> onChanged;

  const TabboxB({Key key, this.active, this.onChanged}) : super(key: key);

  void _handleTap(){
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(

        child: Center(
          child: Text(
            active ? 'Actice': 'Inactice',
            style: TextStyle(fontSize: 32.0,color: Colors.amber),
          ),
        ),

        width: 200.0,
        height: 200.0,

        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),

      ),
    );

  }
}


