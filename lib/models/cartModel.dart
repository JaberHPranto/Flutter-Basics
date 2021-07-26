import 'package:flutter_tutorial/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catelog.dart';

class CartModel {
  CatelogModel _catalog = CatelogModel();

  // storing all ids
  List<int> _itemIds = [];

  // ignore: unnecessary_getters_setters
  CatelogModel get catalog => _catalog;

  // ignore: unnecessary_getters_setters
  set catalog(CatelogModel newCatalog) {
    _catalog = newCatalog;
  }

  // get all items from list
  List<Item> get items =>
      _itemIds.map((id) => _catalog.getItemById(id)).toList();

  // total price
  num get totalPrice =>
      items.fold(0, (previousValue, element) => previousValue + element.price);

// add item to list

  // remove item
  void removeItem(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}
