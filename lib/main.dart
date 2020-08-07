import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

void main() {
  runApp(
    new MaterialApp(home: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

//SimpleDialog
enum Answers { YES, NO, MAYBE }

class _State extends State<MyApp> {
  String helloWorld = "Hello World!";

  bool value1 = false;
  bool value2 = false;

  int radioValue1 = 0;
  int radioValue2 = 0;

  void setRadioValue1(int value) => setState(() {
        radioValue1 = value;
        helloWorld = "Radio Value is ${value.toString()}";
      });
  void setRadioValue2(int value) => setState(() {
        radioValue2 = value;
        helloWorld = "Radio Tile Value is ${value.toString()}";
      });

  // void _value1Changed(bool value) => setState(() => value1 = value);
  void chkBoxValue1Changed(bool newValue) => setState(() => value1 = newValue);
  void chkBoxValue2Changed(bool newValue) => setState(() {
        value2 = newValue;
        helloWorld = "Check box value is $value2";
      });

  void btnOnClick() {
    setState(() {
      helloWorld = "This is Hello World after click!!!";
    });
  }

  bool switchValue1 = false;
  bool switchValue2 = false;
  void switchValue1Changed(bool newValue) =>
      setState(() => switchValue1 = newValue);
  void switchValue2Changed(bool newValue) => setState(() {
        switchValue2 = newValue;
        helloWorld = "Switch Value: $switchValue2";
      });

  void btnWithParameterOnClick(String value) {
    setState(() {
      helloWorld = value;
    });
  }

  void btnFlatBtnOnClick() {
    print("flat button");
    setState(() {
      helloWorld = new DateTime.now().toString();
    });
  }

  void btnIconBtnOnClick() {
    setState(() {
      helloWorld = new DateTime.now().toString();
    });
  }

  void txtFldOnChange(String newValue) {
    setState(() {
      helloWorld = "Value in text field is : $newValue";
    });
  }

  double sliderValue = 0.0;
  void setSliderValue(double value) => setState(() {
        helloWorld = "Slider value is $value";
        sliderValue = value;
      });

  //Date Picker
  String dateValue = '';

  Future selectDate() async {
    DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1987),
        lastDate: new DateTime(2087));
    if (pickedDate != null) {
      setState(() {
        dateValue = pickedDate.toString();
        helloWorld = "Selected Date: $dateValue";
      });
    }
  }

  //Appbar
  int appBarValue = 0;
  void addAppBarValue() => setState(() {
        appBarValue++;
        helloWorld = "Appbar value: $appBarValue";
      });
  void removeAppBarValue() => setState(() {
        appBarValue--;
        helloWorld = "Appbar value: $appBarValue";
      });

  //Floating Action button
  String floatingActionValue = '';
  void btnFloatingActionClicked() {
    setState(() {
      floatingActionValue = new DateTime.now().toString();
      helloWorld = "Floating Time: $floatingActionValue";
    });
  }

  //Footer
  String footerValue = '';
  void btnFooterClick(String value) =>
      setState(() => helloWorld = "Footer Value: $value");

  //Bottom navigation bar
  List<BottomNavigationBarItem> bottomBarItems;
  int bottomIndex = 0;

  //bottom sheet
  void showBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return new Container(
            padding: new EdgeInsets.all(15.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Text(
                  "Some info here",
                  style: new TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold),
                ),
                new RaisedButton(
                  onPressed: () => Navigator.pop(context),
                  child: new Text('Close'),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home"),
        backgroundColor: Colors.orange,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.add), onPressed: addAppBarValue),
          new IconButton(
              icon: new Icon(Icons.remove), onPressed: removeAppBarValue),
        ],
      ),
      drawer: new Drawer(
        child: new Container(
          padding: new EdgeInsets.all(32),
          child: new Column(
            children: <Widget>[
              new Text("Menu"),
              new RaisedButton(
                child: new Text("Click me"),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: btnFloatingActionClicked,
        backgroundColor: Colors.red,
        mini: false,
        child: new Icon(Icons.timer),
      ),
      persistentFooterButtons: [
        new IconButton(
          icon: new Icon(Icons.timer),
          onPressed: () => btnFooterClick("Button 1"),
        ),
        new IconButton(
          icon: new Icon(Icons.pageview),
          onPressed: () => btnFooterClick("Button 2"),
        ),
        new IconButton(
          icon: new Icon(Icons.ac_unit),
          onPressed: () => btnFooterClick("Button 3"),
        ),
      ],
      key: snackBarKeyState,
      body: new Container(
        padding: new EdgeInsets.all(32),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new Text(helloWorld),
              showSimpleDialogWidget(),
              showAlertWidget(),
              snackBar(),
              bottomSheet(),
              new RaisedButton(
                onPressed: selectDate,
                child: new Text("Date"),
              ),
              new Slider(value: sliderValue, onChanged: setSliderValue),
              new Switch(value: switchValue1, onChanged: switchValue1Changed),
              new SwitchListTile(
                value: switchValue2,
                onChanged: switchValue2Changed,
                title: new Text(
                  "Hello Switch",
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red),
                ),
              ),
              new Checkbox(value: value1, onChanged: chkBoxValue1Changed),
              new CheckboxListTile(
                value: value2,
                onChanged: chkBoxValue2Changed,
                title: new Text('Title'),
                controlAffinity: ListTileControlAffinity.leading,
                subtitle: new Text('Subtitle'),
                secondary: new Icon(Icons.archive),
                activeColor: Colors.red,
              ),
              new TextField(
                decoration: new InputDecoration(
                  labelText: "Name",
                  hintText: "Enter your name here",
                  icon: new Icon(Icons.people),
                ),
                autocorrect: true,
                keyboardType: TextInputType.text,
                onChanged: (value) => txtFldOnChange(value),
              ),
              new RaisedButton(
                onPressed: btnOnClick,
                child: new Text("Raised Button"),
              ),
              new RaisedButton(
                onPressed: () => btnWithParameterOnClick(
                    "This is a paramter passed to function"),
                child: new Text("Button with Paramters"),
              ),
              new FlatButton(
                onPressed: btnFlatBtnOnClick,
                child: new Text("Flat button"),
              ),
              new IconButton(
                icon: new Icon(Icons.alarm),
                onPressed: btnIconBtnOnClick,
              ),
              makeRadios(),
              makeRadioTiles(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        fixedColor: Colors.blue,
        currentIndex: bottomIndex,
        onTap: (int item) {
          setState(() {
            bottomIndex = item;
            helloWorld = "Current selected index is: ${bottomIndex.toString()}";
          });
        },
      ),
    );
  }

  //Snack Bar
  final GlobalKey<ScaffoldState> snackBarKeyState =
      new GlobalKey<ScaffoldState>();
  void showSnackBar() {
    snackBarKeyState.currentState
        .showSnackBar(new SnackBar(content: new Text("Hello Snack Bar")));
  }

  Widget snackBar() {
    return Container(
        child: new RaisedButton(
      onPressed: showSnackBar,
      child: new Text("Show Snack Bar"),
    ));
  }

  Widget bottomSheet() {
    return Container(
      child: new RaisedButton(
        onPressed: showBottomSheet,
        child: new Text("Bottom Sheet"),
      ),
    );
  }

  Widget makeRadioTiles() {
    List<Widget> list = new List<Widget>();

    for (int i = 0; i < 3; i++) {
      list.add(new RadioListTile(
        value: i,
        groupValue: radioValue2,
        onChanged: setRadioValue2,
        activeColor: Colors.green,
        controlAffinity: ListTileControlAffinity.trailing,
        title: new Text('Item: $i'),
      ));
    }
    Column column = new Column(
      children: list,
    );
    return column;
  }

  Widget makeRadios() {
    List<Widget> list = new List<Widget>();

    for (int i = 0; i < 3; i++) {
      list.add(new Radio(
          value: i, groupValue: radioValue1, onChanged: setRadioValue1));
    }
    Column column = new Column(
      children: list,
    );
    return column;
  }

  //Alert
  Future showAlert(BuildContext context, String message) async {
    return showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text(message),
          actions: [
            new FlatButton(
                onPressed: () => Navigator.pop(context), child: new Text("OK"))
          ],
        ));
  }

  Widget showAlertWidget() {
    return Container(
      child: new RaisedButton(
        onPressed: () => showAlert(context, "Do you like Flutter ?"),
        child: new Text("Alert Button"),
      ),
    );
  }

  //Simple Dialog
  void setSimpleDialogValue(String value) {
    setState(() {
      helloWorld = "Simple Dialog Selected Value: $value";
    });
  }

  Future showAnswerDialog() async {
    switch (await showDialog(
        context: context,
        child: new SimpleDialog(
            title: new Text("Do you like Flutter? "),
            children: <Widget>[
              new SimpleDialogOption(
                child: new Text("YES Option"),
                onPressed: () => (Navigator.pop(context, Answers.YES)),
              ),
              new SimpleDialogOption(
                child: new Text("NO Option"),
                onPressed: () => (Navigator.pop(context, Answers.NO)),
              ),
              new SimpleDialogOption(
                child: new Text("MAY BE Option"),
                onPressed: () => (Navigator.pop(context, Answers.MAYBE)),
              ),
            ]))) {
      case Answers.YES:
        setSimpleDialogValue("YES");
        break;
      case Answers.NO:
        setSimpleDialogValue("NO");
        break;
      case Answers.MAYBE:
        setSimpleDialogValue("MAY BE");
        break;
    }
  }

  Widget showSimpleDialogWidget() {
    return Container(
      child: new RaisedButton(
        onPressed: showAnswerDialog,
        child: new Text('Show Simple Dialog'),
      ),
    );
  }
}
