import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new XXstate();
  }

  }
class XXstate extends State<MyApp> with SingleTickerProviderStateMixin {
  String xx="Hello ";
  String x2="Click Here";
  bool chval=false;
  int rval=0;
  bool swval=false;
  List<int> _list=new List();
  TabController controller;
  void method1(){
    setState(() {
      x2="Clicked Button";
    });
  }
  void method2(val){
    setState(() {
      chval=val;
      print('$chval');
    });
  }
  void method3(val){
    setState(() {
      rval=val;
      print('$rval');
    });
  }
  void method4(val){
    setState(() {
      swval=val;
      print('$swval');
    });
  }
  void initState(){
    super.initState();
    controller= new TabController(length: 3, vsync: this);
    for (int i=0;i<25;i++){
      _list.add(i);
      print(i);
    }
    print(_list);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(          
            appBar: new AppBar(
              title: new Text("App Bar"),
              backgroundColor: Colors.cyanAccent,
              elevation: 28,
              centerTitle: true,
              titleSpacing: 50,
              toolbarOpacity: 0.5,
              leading: new Icon(Icons.apps),
              actions: <Widget>[
                new IconButton(icon: new Icon(Icons.arrow_back), onPressed: (){print('You pressed Arrow back');}),
                new IconButton(icon: new Icon(Icons.wifi_lock), onPressed: (){print('You pressed Wifi Lock');}),
                new IconButton(icon: new Icon(Icons.brightness_high), onPressed: (){print('You pressed Brighhtnes High');}),

              ],

            ) ,
            bottomNavigationBar:new Material(
              color: Colors.deepOrangeAccent,
              child: new TabBar(
                  controller: controller,
                  tabs: [
                    new Tab(text: "TAB1",),
                    new Tab(text: "TAB2",),
                    new Tab(text: "TAB3",),
                  ]),

            ) ,


            drawer: new Drawer(
              child: new ListView(
                children: <Widget>[
                  new UserAccountsDrawerHeader(
                    accountName: new Text('Aditya Yadav'),
                    accountEmail: new Text('aditya6700@gmail.com'),
                    currentAccountPicture: new CircleAvatar(
                      backgroundColor: Colors.amberAccent,
                      child: new Text('M'),
                    ),
                    decoration: new BoxDecoration(color: Colors.blueGrey),
                  ),
                  new ListTile(
                    title: new Text('T1'),
                    trailing: new Icon(Icons.blur_on),
                  ),
                  new ListTile(
                    title: new Text('T2'),
                    trailing: new Icon(Icons.apps),
                  ),
                  new ListTile(
                    title: new Text('T3'),
                    trailing: new Icon(Icons.ac_unit),
                    onTap: (){Navigator.pop(context);},
                  ),
                ],
              ),
            ),
            body: new Column(
              children: <Widget>[
                new TextField(onChanged: (String st){setState(() {xx=st;});},),
                new RaisedButton(onPressed: (){method1();},child: new Text(x2),),
                new Checkbox(value: chval, onChanged: (bool checkbbol){method2(checkbbol);}),
                new Radio(value: 1, groupValue: rval, onChanged: (int change){method3(change);},),
                new Radio(value: 2, groupValue: rval, onChanged: (int change){method3(change);},),
                new Radio(value: 3, groupValue: rval, onChanged: (int change){method3(change);},),
                new Switch(value: swval, onChanged: (bool x){method4(x);},),
                new ListView(
                  children: <Widget>[
                    new ListTile(
                      title: new Text('ListView 1'),
                      isThreeLine: true,
                      trailing: new Icon(Icons.weekend),
                      subtitle: new Text('Subtitle 1'),

                    ),
                    new ListTile(
                      title: new Text('ListView 2'),
                      isThreeLine: true,
                      trailing: new Icon(Icons.print),
                      subtitle: new Text('Subtitle 2'),

                    ),
                    new ListTile(
                      title: new Text('ListView 3'),
                      isThreeLine: true,
                      trailing: new Icon(Icons.arrow_back),
                      subtitle: new Text('Subtitle 3'),

                    ),
                  ],
                ),
                new ListView.builder(
                  itemBuilder: (BuildContext context,int index){
                    return new ListTile(
                      title: new Text('Listttt1'),

                    );

                  },),
                new TabBarView(controller: controller,
                  children: <Widget>[
                    new Center(child: new Text("TAB 1"),),
                    new Center(child: new Text("TAB 2"),),
                    new Center(child: new Text("TAB 3"),),
                  ],


                ),

              ],

            ),



        ),

    );

  }
}
