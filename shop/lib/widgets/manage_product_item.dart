import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../screens/edit_product_screen.dart';

class ManageProductItem extends StatelessWidget {
  const ManageProductItem(
      {Key? key, required this.id, required this.title, required this.imageUrl})
      : super(key: key);

  final String id;
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {

    var productData = Provider.of<Products>(context,listen: false);

    return Card(
      
      child: ListTile(
        leading: CircleAvatar(
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(title),
        trailing: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(EditProductScreen.routeName, arguments: id);
                },
                icon: Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {
                    
                    productData.deleteProductById(id);
                },
                icon: Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
