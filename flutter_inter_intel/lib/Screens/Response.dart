import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_inter_intel/Utils/apidata.dart';
import 'package:flutter_inter_intel/Widget/menu.dart';
import 'package:http/http.dart' as http;

class ResponsePage extends StatefulWidget {

  @override 
  State<ResponsePage> createState() => _ResponsePageState();
}

class _ResponsePageState extends State<ResponsePage> {
 Future<List<apidata>>apidataFuture=getUsers();
  static Future<List<apidata>> getUsers()async{
    const url='https://jsonplaceholder.typicode.com/todos?_limit=5';
    final responce=await http.get(Uri.parse(url));
    final body=json.decode(responce.body);
    return body.map<apidata>(apidata.fromJson).toList();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.purple,
      title: Text("RESPONSEPage"),
      leading: MenuWidget(),),
      body: Center(
        child: 
      FutureBuilder<List<apidata>>(
        future:apidataFuture,
        builder: (context,snapshot) 
        {
          if(snapshot.connectionState==ConnectionState.waiting)
          {
          return const CircularProgressIndicator();
          }
          else if(snapshot.hasError){
            return Text('${snapshot.error}');
           }
          else if(snapshot.hasData){
            final apidata=snapshot.data;
            return builddata(apidata);
          }else{
            return const Text("no user data");
          }
        },)
      
      ),
    );
  }
}
Widget builddata(List<apidata>users)=>ListView.builder(
  itemCount: users.length,
  itemBuilder: (context,index){
    final apidata=users[index];
    final userid=apidata.userId.toString();
    final id=apidata.id.toString();
    final title=apidata.title;
    final comp=apidata.completed.toString();

    return Card(
      child: 
      Column(children: [
        Text("user id: $userid"),
        SizedBox(
            height: 10,
          ),
        Text("id: $id"),
        SizedBox(
            height: 10,
          ),
        Text("title: $title"),
        SizedBox(
            height: 10,
          ),
        Text("completed: $comp")
      ],)
    );
  }
  );