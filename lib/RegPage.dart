import 'package:flutter/material.dart';

class RegPage extends StatefulWidget{
  RegPage({Key key}) : super(key: key);
  @override
  _RegPageState createState() => _RegPageState();
}


class _RegPageState extends State<RegPage>{

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autovalidate = false;
  bool _valueCheckBox1 = false;
  bool _valueCheckBox2 = false;

  String _name;
  String _secondName;
  String _patronymic;
  String _login;
  String _phoneNumber;

 //Widget dropDownButton;
  Widget nameWidget;
  Widget secondNameWidget;
  Widget patronymicWidget;
  Widget emailWidget;
  Widget phoneNumberWidget;
  Widget buttonReg;
  Widget checkBox1;
  Widget checkBox2;

  List<String> flul = List<String>();
  String _dropDownValue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Регистрация',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Регистрация'),
          leading: Image.asset('assets/logo.png'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              autovalidate: _autovalidate,
              child: FormUI()
            ),
          ),
        ),
      ),
    );
  }

  Widget FormUI(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _createDropDownButton(),
        nameWidget,
        secondNameWidget,
        patronymicWidget,
        emailWidget,
        phoneNumberWidget,
        _createCheckBox1('Title1'),
        _createCheckBox2('Title2'),
        buttonReg,
      ],
    );
  }




  @override
  void initState(){
    super.initState();

    flul.addAll(['Физическое лицо', 'Юридическое лицо']);
    _dropDownValue = flul.elementAt(0);

    nameWidget = Container(
      margin: EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
      child: TextFormField(
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Имя',
            contentPadding: EdgeInsets.fromLTRB(18, 10, 18, 10),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0)
            )
        ),
        validator: _validateFIO,
        onEditingComplete: _validateInputs,
        onSaved: (String value){
          _name = value;
        },
      ),
    );

    secondNameWidget = Container(
      margin: EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
      child: TextFormField(
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Фамилия',
            contentPadding: EdgeInsets.fromLTRB(18, 10, 18, 10),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0)
            )
        ),
        validator: _validateFIO,
        onEditingComplete: _validateInputs,
        onSaved: (String value){
          _secondName = value;
        },
      ),
    );

    patronymicWidget = Container(
      margin: EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
      child: TextFormField(
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Отчество',
            contentPadding: EdgeInsets.fromLTRB(18, 10, 18, 10),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0)
            )
        ),
        validator: _validateFIO,
        onEditingComplete: _validateInputs,
        onSaved: (String value){
          _patronymic = value;
        },
      ),
    );

    emailWidget = Container(
      margin: EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Логин (e-mail)',
            contentPadding: EdgeInsets.fromLTRB(18, 10, 18, 10),
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

    phoneNumberWidget = Container(
      margin: EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
      child: TextFormField(
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Мобильный номер',
            contentPadding: EdgeInsets.fromLTRB(18, 10, 18, 10),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0)
            )
        ),
        validator: _validatePhoneNumber,
        onEditingComplete: _validateInputs,
        onSaved: (String value){
          _phoneNumber = value;
        },
      ),
    );

    /*checkBox1 = Container(
      margin:  EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
      child: SizedBox(
        width: double.infinity,
        child: CheckboxListTile(
            title: Text('Text1'),
            controlAffinity: ListTileControlAffinity.leading,
            value: _valueCheckBox1,
            onChanged: _valueCheckBox1Changed
        ),
      ),
    );

    checkBox2 = Container(
      margin:  EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
      child: SizedBox(
        width: double.infinity,
        child: CheckboxListTile(
            title: Text('Text2'),
            controlAffinity: ListTileControlAffinity.leading,
            value: _valueCheckBox2,
            onChanged: _valueCheckBox2Changed
        ),
      ),
    );*/


    buttonReg = Container(
        margin: EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          child: RaisedButton(
            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(5.0)),
            color: Colors.blue,
            textColor: Colors.white,
            child: Text(
              'Регистрация',
              style: TextStyle(
                  fontSize: 20
              ),
            ),
            onPressed: (){},
          ),
        )
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

  void _valueCheckBox1Changed(bool value){
    setState(() {
      _valueCheckBox1 = value;
    });
  }

  void _valueCheckBox2Changed(bool value){
    setState(() {
      _valueCheckBox2 = value;
    });
  }

  Container _createDropDownButton(){
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.0, style: BorderStyle.solid),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
      ),
      margin: EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
      child: DropdownButtonHideUnderline(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton(
              value: _dropDownValue,
              onChanged: (String newValue){
                setState(() {
                  _dropDownValue = newValue;
                });
              },
              items: flul.map((String value){
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          )
      ),
    );
  }

  Container _createCheckBox1(String title){
    return checkBox1 = Container(
      margin:  EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
      child: SizedBox(
        width: double.infinity,
        child: CheckboxListTile(
            title: Text(title),
            controlAffinity: ListTileControlAffinity.leading,
            value: _valueCheckBox1,
            onChanged: _valueCheckBox1Changed
        ),
      ),
    );
  }

  Container _createCheckBox2(String title){
    return checkBox1 = Container(
      margin:  EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
      child: SizedBox(
        width: double.infinity,
        child: CheckboxListTile(
            title: Text(title),
            controlAffinity: ListTileControlAffinity.leading,
            value: _valueCheckBox2,
            onChanged: _valueCheckBox2Changed
        ),
      ),
    );
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

  static String _validateFIO(String value){
    Pattern pattern = r'[а-яА-яёЁ]{2,50}$';
    RegExp regExp = RegExp(pattern);
    if(!regExp.hasMatch(value)){
      return 'Поле может содержать только русские буквы';
    }else{
      return null;
    }
  }

  static String _validatePhoneNumber(String value){
    Pattern pattern = r'^(\+7)[\d]{10}$';
    RegExp regExp = RegExp(pattern);
    if(!regExp.hasMatch(value)){
      return 'Номер должен начинаться с +7';
    }else{
      return null;
    }
  }

}