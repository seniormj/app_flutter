import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var controller = Controller();

  _textFiled({String labelText, onChanged, String Function() errorText}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
          errorText: errorText == null ? null : errorText()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Form"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Observer(builder: (_) {
                return _textFiled(
                    errorText: controller.validateName,
                    labelText: "nome",
                    onChanged: controller.client.changeName);
              }),
              SizedBox(height: 50),
              Observer(builder: (_) {
                return _textFiled(
                    errorText: controller.validateEmail,
                    labelText: "email",
                    onChanged: controller.client.changeEmail);
              }),
              SizedBox(height: 50),
              Observer(builder: (_) {
                return _textFiled(
                    errorText: controller.validateCpf,
                    labelText: "cpf",
                    onChanged: controller.client.changeCpf);
              }),
              SizedBox(height: 50),
              Observer(builder: (_) {
                return RaisedButton(
                  onPressed: controller.isValid ? () {} : null,
                  child: Text("Salvar"),
                );
              }),
            ],
          ),
        ));
  }
}
