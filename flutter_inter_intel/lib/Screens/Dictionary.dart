import 'package:flutter/material.dart';
import 'package:flutter_inter_intel/Widget/form_input_field.dart';
import 'package:flutter_inter_intel/Widget/menu.dart';
import 'package:motion_toast/motion_toast.dart';
class Item {
  String number;
  double numval;

  Item({this.number, this.numval});
}

class DictionaryPage extends StatefulWidget {

  @override
  State<DictionaryPage> createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _numController;
  TextEditingController _numvalController;
  List<Item> items = [];
  bool sort = false;

  @override
  void initState() {
    super.initState();
    _numController = TextEditingController();
    _numvalController = TextEditingController();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.purple,
      title: Text("SortingPage"),
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
                  itemController: _numController,
                  hintText: 'number in words',
                  validateMessage: 'Please provide no in words',
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: FormInputField(
                        itemController: _numvalController,
                        hintText: 'number value',
                        validateMessage: 'Please number value',
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                ElevatedButton(onPressed: (){ 
                  if (_formKey.currentState.validate()) {
                          items.add(Item(
                              number: _numController.text,
                              numval: double.parse(_numvalController.text)));
                          setState(() {
                            _numController.clear();
                            _numvalController.clear();
                          });
                  showassendingToast(context);
                  var snacktext="Added Succefuly";
                  final snackBar=SnackBar(content: Text(snacktext));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                  },
                child: Text("add"),)],
            ),
          ),
          SizedBox(
            height: 2,
          ),
          DataTable(
            sortColumnIndex: 1,
            sortAscending: sort,
            columns: [
              DataColumn(
                label: Text('number'),
              ),
              DataColumn(
                numeric: true,
                onSort: (int index, bool ascending) {
                  if (ascending) {
                    items.sort((a, b) => b.numval.compareTo(a.numval));
                    showassendingToast(context);
                  } else {
                    items.sort((a, b) => a.numval.compareTo(b.numval));
                    showdesendingToast(context);
                  }
                  setState(() {
                    sort = ascending;
                  });
                },
                label: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('number val'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
            rows:
                mapItemToDataRows(items).toList(),
          ) 
      ],
      )
    );
  }
  @override
  void dispose() {
    super.dispose();
    _numController.dispose();
    _numvalController.dispose();
  }

  Iterable<DataRow> mapItemToDataRows(List<Item> items) {
    Iterable<DataRow> dataRows = items.map((item) {
      return DataRow(
          cells: [
        DataCell(
          Text(item.number),
        ),
        DataCell(
          Text(
            item.numval.toString(),
          ),
        ),
      ]);
    });
    return dataRows;
  }
}
void showassendingToast(context){
  MotionToast.success(
    description: Text("sorted in assending order"),
    title: Text("sorted in assending order"),
    //toastDuration:,
    );
}
void showdesendingToast(context){
  MotionToast.success(
    description: Text("sorted dessending order"),
    title: Text("sorted dessending order")
    );
}
