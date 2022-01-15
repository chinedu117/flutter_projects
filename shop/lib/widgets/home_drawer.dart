import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: Text("Drawer"),
          automaticallyImplyLeading: false,
        ),

        ListTile(
          onTap: (){
            
          },
          leading: Icon(Icons.edit),
          title: Text("Orders"),

          

        )
      ],
    );
  }
}
