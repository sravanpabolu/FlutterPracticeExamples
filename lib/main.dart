import 'package:flutter/material.dart';

void main() {
  runApp(
    new MaterialApp(home: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  TextEditingController _user = new TextEditingController();
  TextEditingController _pass = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Home")),
      body: new Container(
        padding: new EdgeInsets.all(32),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text("Login Form"),
              new Row(
                children: [
                  new Text("Username"),
                  new Expanded(
                    child: new TextField(
                      controller: _user,
                    ),
                  )
                ],
              ),
              new Row(
                children: [
                  new Text("Password"),
                  new Expanded(
                    child: new TextField(
                      controller: _pass,
                      obscureText: true,
                    ),
                  )
                ],
              ),
              new Padding(
                  padding: new EdgeInsets.all(12),
                  child: new RaisedButton(
                    child: new Text("Submit"),
                    onPressed: () => print("Login User: ${_user.text}"),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
