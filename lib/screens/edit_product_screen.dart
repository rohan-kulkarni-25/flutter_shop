import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/product.dart';
import 'package:flutter_shop/providers/products_provider.dart';
import 'package:provider/provider.dart';

class EditProductScreen extends StatefulWidget {
  static String routeName = '/edit-product-screen';

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _isInit = true;
  var _intiValues = {
    'title': '',
    'description': '',
    'price': 0,
    'imageUrl': ''
  };
  String _imageUrl = '';
  var _editedProduct =
      Product(id: '', title: '', price: 0, description: '', imageUrl: '');

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);

    super.initState();
  }

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _isInit = false;
      final productId = ModalRoute.of(context)!.settings.arguments;
      if (productId != null) {
        final product =
            Provider.of<Products>(context, listen: false)
            .findById(productId.toString());
        _editedProduct = product;
        _intiValues = {
          'title': _editedProduct.title,
          'description': _editedProduct.description,
          'price': _editedProduct.price.toString(),
          'imageUrl': '',
        };
        _imageUrlController.text = _editedProduct.imageUrl;
        setState(() {
          _imageUrl = _editedProduct.imageUrl;
        });
      }
    }
  }

  void _saveForm() {
    // print('hello');
    final isValid = _form.currentState?.validate();
    if (isValid == true) {
      if (_editedProduct.id != '') {
        _form.currentState?.save();
        final product = Provider.of<Products>(context, listen: false)
            .updateProduct(_editedProduct.id, _editedProduct);
        Navigator.of(context).pop();
      } else {
        _form.currentState?.save();
        final product = Provider.of<Products>(context, listen: false)
            .addProduct(_editedProduct);
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
          actions: [
        IconButton(
            onPressed: () {
              _saveForm();
            },
            icon: Icon(Icons.save))
      ]),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _intiValues['title'].toString(),
                decoration: InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return 'Please provide a title';
                  } else {
                    return null;
                  }
                },
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_priceFocusNode),
                onSaved: (value) => {
                  _editedProduct = Product(
                    title: value.toString(),
                    description: _editedProduct.description,
                    price: _editedProduct.price,
                    imageUrl: _editedProduct.imageUrl,
                    id: _editedProduct.id,
                    isFavourite: _editedProduct.isFavourite,
                  )
                },
              ),
              TextFormField(
                initialValue: _intiValues['price'].toString(),
                decoration: InputDecoration(labelText: 'Price'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocusNode,
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return 'Please provide price';
                  } else if (double.tryParse(value.toString()) == null) {
                    return 'Please enter a valid number';
                  } else if (double.parse(value.toString()) <= 0) {
                    return 'Please enter price greater than 0';
                  } else {
                    return null;
                  }
                },
                onFieldSubmitted: (_) =>
                    FocusScope.of(context).requestFocus(_descriptionFocusNode),
                onSaved: (value) => {
                  _editedProduct = Product(
                    id: _editedProduct.id,
                    isFavourite: _editedProduct.isFavourite,
                    title: _editedProduct.title,
                    description: _editedProduct.description,
                    price: double.parse(value.toString()),
                    imageUrl: _editedProduct.imageUrl,
                  )
                },
              ),
              TextFormField(
                initialValue: _intiValues['description'].toString(),
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocusNode,
                onSaved: (value) => {
                  _editedProduct = Product(
                    id: _editedProduct.id,
                    isFavourite: _editedProduct.isFavourite,
                    title: _editedProduct.title,
                    description: value.toString(),
                    price: _editedProduct.price,
                    imageUrl: _editedProduct.imageUrl,
                  )
                },
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return 'Please provide a description';
                  } else {
                    return null;
                  }
                },
              ),
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 8, right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: _imageUrl == ''
                        ? Center(
                            child: Text(
                            'Please Enter Url',
                            textAlign: TextAlign.center,
                          ))
                        : Image.network(_imageUrl),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Image URL'),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageUrlController,
                      focusNode: _imageUrlFocusNode,
                      onFieldSubmitted: (_) {
                        _saveForm();
                        setState(() {
                          _imageUrl = _imageUrlController.text;
                        });
                      },
                      onSaved: (value) => {
                        _editedProduct = Product(
                          id: _editedProduct.id,
                          isFavourite: _editedProduct.isFavourite,
                          title: _editedProduct.title,
                          description: _editedProduct.description,
                          price: _editedProduct.price,
                          imageUrl: value.toString(),
                        ),
                      },
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return 'Please provide a imageurl';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
