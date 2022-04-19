import 'package:flutter/material.dart';
import 'package:flutter_inter_intel/Screens/Design.dart';
import 'package:flutter_inter_intel/Screens/Dictionary.dart';
import 'package:flutter_inter_intel/Screens/Info.dart';
import 'package:flutter_inter_intel/Screens/Response.dart';
import 'package:flutter_inter_intel/Utils/Sharedpreferences.dart';
import 'package:flutter_inter_intel/Widget/Menu_item.dart';
import 'package:flutter_inter_intel/Widget/menupage.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedUserPreferences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  Menuitem currentitem=MenuItems.Info;


  @override
  Widget build(BuildContext context) =>ZoomDrawer(
    style: DrawerStyle.Style1,
    mainScreen: getscreen(),
    menuScreen: Builder(
      builder: (context)=>MenuPage(
          currentitem=currentitem,
         onSelectedItem:(item){
          setState(() {currentitem=item;});
          ZoomDrawer.of(context).close();}
        )
    ),
  );
  Widget getscreen(){
  switch (currentitem) {
    case MenuItems.Info:
     return InfoPage();
  }
  switch (currentitem) {
    case MenuItems.Design :
     return DesignPage();
  }
  switch (currentitem) {
    case MenuItems.Response:
     return ResponsePage();
  }
  switch (currentitem) {
    case MenuItems.Dictionary:
     return DictionaryPage();
  }
}
}
