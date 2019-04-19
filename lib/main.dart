import 'package:flutter/material.dart';

void main() => runApp(LoginPage());

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage>{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autovalidate = false;
  String _login;
  String _password;

  Widget loginWidget;
  Widget passwordWidget;
  Widget buttonEnter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Личный кабинет',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        //resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            title: Text('Личный кабинет'),
            leading: Image.asset('assets/logo.png'),
          ),
          body: Center(
            child: SingleChildScrollView(
              child:  Form(
                key: _formKey,
                autovalidate: _autovalidate,
                child: FormUI()
              )
            ),
          )
      ),
    );
  }

  Widget FormUI(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        loginWidget,
        passwordWidget,
        buttonEnter,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _createText(Colors.black, 'Нет учетной записи? '),
            InkWell(
              onTap: (){
                print('Зарегстрируйтесь!');
              },
              child: _createText(Colors.blue, 'Зарегистрируйтесь!'),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _createText(Colors.black, 'Забыли пароль? '),
            InkWell(
              onTap: (){
                print('Напомнить!');
              },
              child: _createText(Colors.blue, 'Напомнить!'),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _createButtonIcon(Colors.blue, Colors.black, Icons.credit_card, 'Оплатить'),
              _createButtonIcon(Colors.blue, Colors.black, Icons.location_on, 'Офисы рядом'),
            ],
          ),
        )
      ],
    );
  }





  @override
  void initState(){
    super.initState();
    loginWidget = Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(bottom: 20.0),
      //margin: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Логин',
            contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0)
            )
        ),
        validator: _validateEmail,
        onEditingComplete: _validateInputs,
        onSaved: (String value){
          _login = value;
        },
      ),
    );

    passwordWidget = Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(bottom: 20.0),
      //margin: EdgeInsets.all(8),
      child: TextFormField(
        autofocus: false,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Пароль',
            contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0)
            )
        ),
        validator: _validatePassword,
        onEditingComplete: _validateInputs,
        onSaved: (String value){
          _password = value;
        },
      ),
    );



    buttonEnter = Container(
        margin: EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          child: RaisedButton(
            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(5.0)),
            color: Colors.blue,
            textColor: Colors.white,
            child: Text(
              'Вход',
              style: TextStyle(
                  fontSize: 20
              ),
            ),
            onPressed: (){},
          ),
        )
    );
  }

  Column _createButtonIcon(Color colorIcon, Color colorLabel, IconData icon, String label){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: colorIcon, size: 40,),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: colorLabel
            ),
          ),
        )
      ],
    );
  }

  Container _createText(Color color, String label){
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Text(
        label,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: color
        ),
      ),
    );
  }

  void _validateInputs(){
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
    }else{
      setState(() {
        _autovalidate = true;
      });
    }
  }

  static String _validateEmail(String value){
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if(!regExp.hasMatch(value)){
      return 'Введите корректный почтовый адрес';
    }else{
      return null;
    }
  }

  static String _validatePassword(String value){
    if(value.isNotEmpty){
      Pattern pattern = r'(?=.*[0-9])(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*]{8,}';
      RegExp regExp = RegExp(pattern);
      if(!regExp.hasMatch(value)){
        return 'Пароль должен быть больше 7 символов, \n'
            'содержать цифру, \n'
            'заглавную букву, \n'
            'специальный символ';
      }else{
        return null;
      }
    }else{
      return 'Пароль не может быть пустым';
    }
  }
}
