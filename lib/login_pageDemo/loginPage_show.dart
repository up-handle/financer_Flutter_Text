
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:financer_hengchang/Tools/colors_tool.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'enter_state.dart';

class LoginShowPageVC extends StatefulWidget {
  @override
  _LoginShowPageVCState createState() => _LoginShowPageVCState();
}

class _LoginShowPageVCState extends State<LoginShowPageVC> {


  GlobalKey<FormState> _singInFormKey = new GlobalKey();
  FocusNode _userFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  //
  String _nameShowStr = "";
  String _passwordStr = "";
  bool _isShowPassWord = false;
  //按钮的激活
  bool _activeBool = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
//          _userFocusNode.unfocus();
//          _passwordFocusNode.unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Container(
              padding: EdgeInsets.only(top: 160,left: 35,right: 35),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[

                  Text(
                    "登录小恒理财师",
                    style: TextStyle(color: Colors.black, fontSize: 28.0),
                  ),
                  Text(
                    "请输入您的手机号和密码登录",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),

                  SizedBox(height:80),
                  _buildPasswordTextField(),
                  SizedBox(height:30),

                  _showLoginButtonView(),

                  SizedBox(height:12),
                  _showForgetAndToRegistShow(),

                ],
              ),
            ),
          ),
        ),
      )
    );
  }


  void _judgeLoginStateShowColorAndEditing(){
    if(_nameShowStr.length == 11 && _passwordStr.length > 6) {
      setState(() {
        _activeBool = true;
      });
    }else{
      setState(() {
        _activeBool = false;
      });
    }
  }


  //创建登录界面的textForm
  Widget _buildPasswordTextField() {
    return Container(
      height: 120,
      color: Colors.white,
      child: Form(
        key: _singInFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildUserNameTextField(),
            Container(height: 1,color: Colors.grey[200],),
            _buildPasswoldTextField(),
            Container(height: 1,color: Colors.grey[200],),
          ],
        ),
      ),
    );
  }

  //创建账号输入的textField
  Widget _buildUserNameTextField(){
    //Flexible
    return Expanded(
      child: TextFormField(
        //readOnly: true,
        controller: TextEditingController.fromValue(TextEditingValue(
          text: '${_nameShowStr == null ? "" : _nameShowStr}',
          selection: TextSelection.fromPosition(TextPosition(
            affinity: TextAffinity.downstream,
            offset: _nameShowStr.length,
          )),

        )),
        focusNode: _userFocusNode,
        // maxLength: 11,
        decoration: InputDecoration(
          hintText: "手机号码",
          hintStyle: TextStyle(color: ColorsUtil.hexStringColor("#C3C8D2")),
          border: InputBorder.none,
//          contentPadding: EdgeInsets.only(top: 10,),
          contentPadding: const EdgeInsets.symmetric(vertical: 20.0), //可以调整textField的高度
        ),
        style: TextStyle(fontSize: 16,color: Colors.black),
        keyboardType: TextInputType.number,//键盘类型
        //下面这句 表示只让输入数字
        //inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],

        onChanged:(value){
          print(value);
          if(value.length>=11){
            _nameShowStr = value.substring(0,11);
          }else{
            _nameShowStr = value;
          }
          _judgeLoginStateShowColorAndEditing();
        },

        onSaved: (value){
          setState(() {
          });
        },
      ),
    );
  }

  //创建密码输入的textField
  Widget _buildPasswoldTextField() {
    return Expanded(
      child: TextFormField(
        controller: TextEditingController.fromValue(TextEditingValue(
          text: '${_passwordStr == null ? "" :_passwordStr}',
          selection:TextSelection.fromPosition(TextPosition(
            affinity: TextAffinity.downstream,
            offset: _passwordStr.length,
          )),
        )),
        focusNode: _passwordFocusNode,
        decoration: InputDecoration(
          hintText: "请输入您的密码",
          hintStyle: TextStyle(color: ColorsUtil.hexStringColor("#C3C8D2")),
          contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: _isShowPassWord ? Image.asset('images/open_state@3x.png',width: 18,height: 18,) :Image.asset('images/close_state@3x.png',width: 18,height: 18,),
            onPressed: (){
              setState(() {
                _isShowPassWord = !_isShowPassWord;
              });
            },
          ),
        ),
        obscureText: !_isShowPassWord,
        style: TextStyle(fontSize: 16, color: Colors.black),
        onChanged: (value){
          print(value);
          if(value.length >= 20){
            _passwordStr = value.substring(0,20);
          }else {
            _passwordStr = value;
          }
          _judgeLoginStateShowColorAndEditing();
        },
        onSaved: (value) {
          setState(() {});
        },
      ),
    );
  }

  //创建登录按钮的button
  Widget _showLoginButtonView(){
    return Container(
      //padding: EdgeInsets.all(1),
      //alignment: Alignment.center,
      color: Colors.white,
      width: MediaQuery.of(context).size.width - 70.0,
      height: 46,
      child: RaisedButton(
        color: _activeBool ? Colors.indigoAccent : ColorsUtil.hexStringColor("#CCCED6"),

        onPressed: !_activeBool ? null : (){

          //点击了登录button
          if(_singInFormKey.currentState.validate()) {
            //
            _userFocusNode.unfocus();
            _passwordFocusNode.unfocus();
            //
            _incrementUserName();



            print("验证通过");
          }
        },
        child: Text("登 录",style: TextStyle(fontSize: 16,color: Colors.white),),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(23.0)),
      ),
    );
  }

    void _incrementUserName() async{
       SharedPreferences prefs = await SharedPreferences.getInstance();
       prefs.setString('userName', _nameShowStr);
       //存储之后就验证换页面
       Navigator.of(context).pushAndRemoveUntil(
           new MaterialPageRoute(builder: (context) => new Enter()
           ), (route) => route == null);

   }

  //快速注册和忘记密码
  Widget _showForgetAndToRegistShow(){
    return Container(
      width: MediaQuery.of(context).size.width - 50.0,
      height: 30,
      color: Colors.white,
      child: Row(
        children: <Widget>[

          GestureDetector(child: Text("快速注册",style: TextStyle(fontSize: 14,color: ColorsUtil.hexStringColor("#797A90")),textAlign:TextAlign.left,),onTap: (){
            print("点击快速注册");
          },),

          Expanded(child: Container()),

          GestureDetector(onTap: (){
            print("点击忘记密码");
          },child: Text("忘记密码",style: TextStyle(fontSize: 14,color: ColorsUtil.hexStringColor("#797A90")),textAlign:TextAlign.right,),),


        ],
      ),
    );
  }


}
