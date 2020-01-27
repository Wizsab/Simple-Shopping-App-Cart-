import 'package:flutter/material.dart';
import 'package:simple_flutter_shopping_cart/model/cart_item.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:simple_flutter_shopping_cart/redux/actions.dart';

class ShoppingItem extends StatefulWidget {

  final CartItem item;

  const ShoppingItem({Key key, this.item}) : super(key : key);

  @override
  _ShoppingItemState createState() => _ShoppingItemState();
}

class _ShoppingItemState extends State<ShoppingItem> {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<List<CartItem>,OnItemDeleted>(
      converter: (store) => (itemName) => store.dispatch(DeleteItemAction(widget.item)),
      builder: (context, callback) => Dismissible(
        onDismissed: (_){
          setState(() {
            callback(widget.item.name);
          });
        },
        key: new Key(widget.item.name),
        child: new StoreConnector<List<CartItem>,OnToggleStateAction>(
          converter: (store) => (item) => store.dispatch(ToggleStateItemAction(item)),
          builder: (context, callback) => new ListTile(
            title: new Text(widget.item.name),
            leading: new Checkbox(value: widget.item.checked, onChanged: (value){
              setState(() {
                callback(CartItem(name: widget.item.name, checked: value));
              });
            }, checkColor: Colors.deepOrange,),
          ),
        ),
      ),
    );
  }
}

typedef OnToggleStateAction = Function(CartItem item);

typedef OnItemDeleted = Function(String itemName);