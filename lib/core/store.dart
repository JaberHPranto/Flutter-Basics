import 'package:flutter_tutorial/models/cartModel.dart';
import 'package:flutter_tutorial/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  final CatelogModel catalog = CatelogModel();
  final CartModel cart = CartModel();

  // MyStore() {
  //   catalog = CatelogModel();
  //   cart = CartModel();
  // }
}
