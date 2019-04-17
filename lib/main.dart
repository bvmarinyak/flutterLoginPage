import 'package:flutter/material.dart';

void main() => runApp(LoginPage());

class LoginPage extends StatelessWidget {
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
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                login,
                password,
                buttonEnter,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _createText(Colors.black, 'Нет учетной записи? '),
                    _createText(Colors.blue, 'Зарегистрируйтесь!')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _createText(Colors.black, 'Забыли пароль? '),
                    _createText(Colors.blue, 'Напомнить!')
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
            ),
          ),
        )
      ),
    );
  }


  final login = Container(
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
    ),
  );

  final password = Container(
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
    ),
  );



  final buttonEnter = Container(
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


}
