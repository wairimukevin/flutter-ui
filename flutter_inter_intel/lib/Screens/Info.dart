import 'package:flutter/material.dart';
import 'package:flutter_inter_intel/Screens/Design.dart';
import 'package:flutter_inter_intel/Utils/Sharedpreferences.dart';
import 'package:flutter_inter_intel/Widget/custom_page%20route.dart';
import 'package:flutter_inter_intel/Widget/form_input_field.dart';
import 'package:flutter_inter_intel/Widget/menu.dart';
class Item {
  String Name;
  int Phoneno;
  String email;

  Item({this.Name, this.Phoneno,this.email});
}

class InfoPage extends StatefulWidget {

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _NameController;
  TextEditingController _PhoneController;
  TextEditingController _EmailController;
  List<Item> items = [];
  @override
  void initState() {
    super.initState();
    _EmailController = TextEditingController();
    _PhoneController = TextEditingController();
    _NameController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Infopage"),
      backgroundColor: Colors.purple,
      leading: MenuWidget(),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
      children:[
        Form(
            key: _formKey,
            child: Column(
              children: [
                FormInputField(
                  itemController: _NameController,
                  hintText: 'Name',
                  validateMessage: 'Please provide the your name',
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: 10,
                ),
                FormInputField(
                        itemController: _PhoneController,
                        hintText: 'phone no',
                        validateMessage: 'Please provide phone no',
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: false,
                        ),
                      ),
                      SizedBox(
                  height: 10,
                ),
                FormInputField(
                        itemController: _EmailController,
                        hintText: 'Email',
                        validateMessage: 'Please provide Email',
                        keyboardType: TextInputType.emailAddress
                      ),
                      SizedBox(
                  height: 10,
                ),
                ElevatedButton(onPressed: () async { 
                  if (_formKey.currentState.validate()) {

                    SharedUserPreferences.setusername(_NameController.text);
                    SharedUserPreferences.setemail(_EmailController.text);
                    SharedUserPreferences.setphone(int.parse(_PhoneController.text));
                          items.add(Item(
                              Name: _NameController.text,
                              email: _EmailController.text,
                              Phoneno:int.parse(_PhoneController.text)));
                          setState(() {
                            _NameController.clear();
                            _PhoneController.clear();
                            _EmailController.clear();
                          });
                          Navigator.of(context).push(Custompagerout(child: DesignPage()));
                        }
                    var snacktext="submitted snackbar";
                    final snackBar=SnackBar(content: Text(snacktext));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Text("SUBMIT"),)
              ],
            ),
          ),
      ],)
    );
  }
}


