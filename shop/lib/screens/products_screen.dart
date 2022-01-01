import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  static const routeName = '/';

  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chizmart"),
      ),
      body: GridView.builder(
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 4 / 3,
        ),
        itemBuilder: (ctx, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: GridTile(
              child: Image.network(
                "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
                fit: BoxFit.cover,
              ),
              footer: GridTileBar(
                backgroundColor: Colors.black38,
                title: Text(
                  "Product Name",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                leading: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.shopping_cart),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
