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
              // columnAndRows(),
              expandedFeature(),
              // cardWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget columnAndRows() {
    return Column(
      children: [
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
    );
  }

  Widget expandedFeature() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Text("Image Demo"),
          new Expanded(child: 
            new Image.asset("images/flutter_image.png"),
          ),
          // new Image.asset("images/flutter_image.png"),
          // new Image.asset("images/flutter_image.png"),
          // new Image.asset("images/flutter_image.png"),
          // new Image.asset("images/flutter_image.png"),
          // new Expanded(child: new Image.asset("images/flutter_image.png")),
          // new Expanded(child: new Image.asset("images/flutter_image.png")),
          // new Expanded(
          //     child: new Image.network(
          //         "https://sravanpabolu.github.io/theme/img/sravan_github_profile_img.png")
          //         )
        ],
      ),
    );
  }

  Widget cardWidget() {
    return new Container(
        child: new Column(
      children: [
        new Card(
          child: new Container(
            padding: new EdgeInsets.all(30),
            child:
                new Column(children: [new Text("Card 1"), new Text("Card 2")]),
          ),
        ),
        new Card(
          child: new Container(
            padding: new EdgeInsets.all(30),
            child:
                new Column(children: [new Text("Card 1"), new Text("Card 2")]),
          ),
        ),
        new Card(
          child: new Container(
            padding: new EdgeInsets.all(30),
            child:
                new Column(children: [new Text("Card 1"), new Text("Card 2")]),
          ),
        ),
      ],
    ));
  }


}
