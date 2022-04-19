import 'package:flutter/material.dart';
import 'package:flutter_inter_intel/Widget/Menu_item.dart';

class MenuItems {
   static const Info= Menuitem ('info',Icons.info);
   static const Design= Menuitem ('design',Icons.details);
   static const Response= Menuitem ('responce',Icons.network_cell);
   static const Dictionary= Menuitem ('dictionary',Icons.data_usage);
 static const all=<Menuitem>[
     Info,
     Design,
     Response,
     Dictionary
     ];
  }


class MenuPage extends StatelessWidget { 
final Menuitem currentItem;
final ValueChanged<Menuitem>onSelectedItem;

  const MenuPage(Menuitem menuitem, {
    Key key,
      this.currentItem, 
      this.onSelectedItem,
     }): super(key: key);

  @override
  Widget build(BuildContext context) =>Theme(data: ThemeData.dark(), child: Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
       children: <Widget>[
          Spacer(),
          ...MenuItems.all.map(buildMenuItems).toList(),
          Spacer(flex: 2,)
        ],)),
    )
  );
    Widget buildMenuItems(Menuitem item)=>ListTile(
      selectedTileColor:Colors.red,
      selected: currentItem == item,
      minLeadingWidth: 30,
      leading: Icon(item.icon),
      title: Text(item.title),
      //onTap: (){},
      onTap: ()=>onSelectedItem(item),
    );
}