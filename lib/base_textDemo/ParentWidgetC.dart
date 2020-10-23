

import 'package:flutter/material.dart';


class ParentWidgetC extends StatefulWidget {

  @override
  _ParentWidgetCState createState() => _ParentWidgetCState();

}

class _ParentWidgetCState extends State<ParentWidgetC> {

  bool _active = false;

  void _handleTaopboxChanged(bool newValue){
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('one')),
      body: Container(
        margin: EdgeInsets.only(top: 100,left: 80),
        color: Colors.white,
        child: TapboxC(
          active: _active,
          onChanged: _handleTaopboxChanged,
        ),
      ),
    );
  }
}



class TapboxC extends StatefulWidget {

  final bool active;
  final ValueChanged<bool> onChanged;
  const TapboxC({Key key, this.active, this.onChanged}) : super(key: key);

  @override
  _TapboxCState createState() => _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {

  bool _highlight = false;

  void _handleTapDown(TapDownDetails details){
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details){
    setState(() {
      _highlight = false;
    });
  }


  void _handletapCancel(){
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap(){
    widget.onChanged(!widget.active);
  }


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handletapCancel,

      child: Container(

        child: Center(

          child: Text(
            widget.active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32.0,color: Colors.white),
          ),
        ),

        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight ? Border.all( color: Colors.teal[700],width: 10.0 ) : null,
        ),
      ),

    );




  }
}
