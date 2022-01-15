// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';
import '../providers/products.dart';

class EditProductScreen extends StatefulWidget {
  static const String routeName = 'edit-product';

  EditProductScreen({Key? key}) : super(key: key);

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _form = GlobalKey<FormState>();

  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageurlFocusNode = FocusNode();

  var _imageurlController = TextEditingController();

  Product _editedProduct = Product(
    description: '',
    title: '',
    id: '',
    price: 0.0,
    imageUrl: '',
  );

  void _saveForm() {
    var isValid = _form.currentState!.validate();
    if (!isValid) {
      return; //stop save if any validator fails
    }
    _form.currentState!.save(); // Triggers onSave on all input

    Provider.of<Products>(context, listen: false).addProduct(_editedProduct);
  }

  @override
  void initState() {
    _imageurlFocusNode.addListener(_renderImage);
    super.initState();
  }

  void _renderImage() {
    if (!_imageurlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  void dispose() {
    _imageurlFocusNode.removeListener(_renderImage);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageurlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Product'),
          actions: [
            IconButton(onPressed: _saveForm, icon: const Icon(Icons.save)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _form,
            child: ListView(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Title",
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a title'; // validation fail message
                    }
                    return null; //means the data is valid
                  },
                  onSaved: (value) {
                    //handle save
                    _editedProduct = Product(
                      title: value.toString(),
                      description: _editedProduct.description,
                      imageUrl: _editedProduct.imageUrl,
                      price: _editedProduct.price,
                      id: _editedProduct.id,
                      isFavorite: _editedProduct.isFavorite,
                    );
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_priceFocusNode);
                  },
                ),

                //  Price field //
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Price",
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a price'; // validation fail message
                    }

                    if (double.tryParse(value) == null) {
                      return "Enter a valid price";
                    }

                    if (double.parse(value) <= 0.0) {
                      return "Enter a valid price greater than zero";
                    }
                    return null; //means the data is valid
                  },
                  onSaved: (value) {
                    //handle save
                    _editedProduct = Product(
                      title: _editedProduct.title,
                      description: _editedProduct.description,
                      imageUrl: _editedProduct.imageUrl,
                      price: double.parse(value.toString()),
                      id: _editedProduct.id,
                      isFavorite: _editedProduct.isFavorite,
                    );
                  },
                  focusNode: _priceFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_descriptionFocusNode);
                  },
                ),

                //  Description field //
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Description",
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  // textInputAction: TextInputAction.next, You dont need textinput action for a multiline keyboard
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter a description'; // validation fail message
                    }

                    return null; //means the data is valid
                  },
                  onSaved: (value) {
                    //handle save
                    _editedProduct = Product(
                      title: _editedProduct.title,
                      description: value.toString(),
                      imageUrl: _editedProduct.imageUrl,
                      price: _editedProduct.price,
                      id: _editedProduct.id,
                      isFavorite: _editedProduct.isFavorite,
                    );
                  },
                  focusNode: _descriptionFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_imageurlFocusNode);
                  },
                ),

                //  Image URL and Preview Field

                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        )),
                        child: _imageurlController.text.isEmpty
                            ? Text('Enter Image Url')
                            : FittedBox(
                                child: Image.network(_imageurlController.text,
                                    fit: BoxFit.cover),
                              )),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Image URL",
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        controller: _imageurlController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter image URL'; // validation fail message
                          }

                          if (!value.startsWith('http:') &&
                              !value.startsWith('https:') &&
                              !value.endsWith('.jpg') &&
                              !value.endsWith('.jpeg') &&
                              !value.endsWith('.png')) {
                            return 'Enter a valid url';
                          }
                          return null; //means the data is valid
                        },
                        onSaved: (value) {
                          //handle save
                          _editedProduct = Product(
                            title: _editedProduct.title,
                            description: _editedProduct.description,
                            imageUrl: value.toString(),
                            price: _editedProduct.price,
                            id: _editedProduct.id,
                            isFavorite: _editedProduct.isFavorite,
                          );
                        },
                        focusNode: _imageurlFocusNode,
                        onFieldSubmitted: (_) {
                          _saveForm();
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
