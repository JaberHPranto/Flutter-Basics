import 'package:flutter/material.dart';
import 'package:flutter_tutorial/core/store.dart';
import 'package:flutter_tutorial/models/cartModel.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [Cartlist().p32().expand(), Divider(), CartTotal()],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // "\$${_cart.totalPrice}".text.xl5.make(),
          VxConsumer(
              notifications: {},
              mutations: {RemoveMutation},
              builder: (context, store, status) =>
                  "\$${_cart.totalPrice}".text.xl5.make()),
          30.widthBox,
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: "Buying not supported yet"
                            .text
                            .color(Colors.redAccent)
                            .make()));
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(context.theme.buttonColor)),
                  child: "Buy".text.make())
              .w32(context)
        ],
      ),
    );
  }
}

class Cartlist extends StatelessWidget {
  const Cartlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Nothing To Show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                  leading: Icon(Icons.done),
                  trailing: IconButton(
                      icon: Icon(Icons.remove_circle_outline),
                      onPressed: () {
                        RemoveMutation(_cart.items[index]);
                      }),
                  title: _cart.items[index].name.text.make(),
                ));
  }
}
