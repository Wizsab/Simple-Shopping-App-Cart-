import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:simple_flutter_shopping_cart/model/cart_item.dart';
import 'package:simple_flutter_shopping_cart/redux/reducers.dart';
import 'package:simple_flutter_shopping_cart/shopping_cart.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

void main(){
  final store = new DevToolsStore<List<CartItem>>(cartItemsReducer,initialState: new List());

  runApp(new ShoppingApp(store: store));
}

class ShoppingApp extends StatelessWidget {

  final DevToolsStore<List<CartItem>> store;

  const ShoppingApp({Key key, this.store}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store,
      child: new MaterialApp(
        theme: new ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: new ShoppingCart(store : store),
      ),
    );
  }
}
