import 'package:flutter/material.dart';
import '../screens/order_screen.dart';

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
            Navigator.of(context).pushNamed(OrderScreen.routeName);
          },
          leading: Icon(Icons.shop),
          title: Text("Orders"),

          

        )
      ],
    );
  }
}
