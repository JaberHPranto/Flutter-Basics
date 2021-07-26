import 'package:flutter_tutorial/models/cartModel.dart';
import 'package:flutter_tutorial/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late CatelogModel catalog;
  late CartModel cart;

  MyStore() {
    catalog = CatelogModel();
    cart = CartModel();
  }
}
