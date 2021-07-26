import 'catelog.dart';

class CartModel {
  late CatelogModel _catalog;

  // storing all ids
  List<int> _itemIds = [];

  CatelogModel get catalog => _catalog;

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
  void addToCart(Item item) {
    _itemIds.add(item.id);
  }

  // remove item
  void removeItem(Item item) {
    _itemIds.remove(item.id);
  }
}
