import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_inter_intel/Utils/Sharedpreferences.dart';
import 'package:flutter_inter_intel/Widget/custom_page%20route.dart';
import 'package:flutter_inter_intel/Widget/menu.dart';
import 'Info.dart';


class DesignPage extends StatefulWidget {
  @override
  _DesignPageState createState() => _DesignPageState();
}

class _DesignPageState extends State<DesignPage> {
  String name;
  String number;
  String email;
  @override
  Void initstate(){
    super.initState();
    name=SharedUserPreferences.getusername()??"";
    number=SharedUserPreferences.getphone()??"";
    email=SharedUserPreferences.getemail()??"";
    print(number);
    print(name);
    print(email);
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.purple,
       title: Text("DesignPage"),
      leading: MenuWidget(),
      actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop(Custompagerout(child: InfoPage()));
              },
            )
  ],
      
      ),
      body: Center(child: Card(
      child:
       ListTile(
      leading:name==null?Text('kevin mwangi'):Text("user name: $name"),
      title:number==null?Text('+254708765437'):Text("user phone no :$number"),
      subtitle:email==null?Text('flutterdev@gmail'):Text("user email :$email"),),
    )
    ),) ;
  }
}