import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: new _myList(),
    );
  }
}

class _myList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        padding: new EdgeInsets.all(4.0),
        itemBuilder: (context,i){
          return new ListTile(
            title : new Text(
              'hello', style: new TextStyle(fontStyle: FontStyle.italic, color: Colors.orange),
            ),
            subtitle: new Text('this is subtitle'),
            leading: new Icon(Icons.face),
            trailing: new RaisedButton(
              child: new Text('Remove'),
              onPressed: (){
                deleteDialog(buildContext).then((onValue){
                  
                }
              },
            ),
          );
        },
    );
  }
}

Future<bool> deleteDialog(BuildContext buildContext){
  return showDialog(
    context: buildContext,
    builder: (BuildContext context){
      return new AlertDialog(
        title: new Text('Are You Sure'),
        actions: <Widget>[
          new FlatButton(
            child: new Text('Yes'),
            onPressed: (){
              Navigator.of(context).pop(true);
            },
          ),
          new FlatButton(
            child: new Text('No'),
            onPressed: (){
              Navigator.of(context).pop(false);
            },
          )
        ],
      );
    }
  );
}