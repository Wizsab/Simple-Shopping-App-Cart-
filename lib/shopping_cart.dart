import 'package:flutter/material.dart';
import 'package:simple_flutter_shopping_cart/add_item_dialog.dart';
import 'package:simple_flutter_shopping_cart/shopping_list.dart';
import 'package:redux/redux.dart';
import 'model/cart_item.dart';
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

class ShoppingCart extends StatelessWidget {

  final DevToolsStore<List<CartItem>> store;

  const ShoppingCart({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Simple Shopping Cart"),
      ),
      body: new ShoppingList(),
      floatingActionButton: new FloatingActionButton(
          onPressed: () => _openAddItemDialog(context),
          child: new Icon(Icons.add),
          splashColor: Colors.amber,
      ),
      endDrawer: new ReduxDevTools(store),
    );
    
  }
}

_openAddItemDialog(BuildContext context){

  showDialog(context: context,builder: (context)=> new AddItemDialog());
  
}
