import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

import 'addToCart.dart';
import 'catalogImage.dart';

class CatalogItem extends StatelessWidget {
  final Item item;
  const CatalogItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(item.id.toString()),
            child: CatalogImage(image: item.image)),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            item.name.text.lg.bold.color(context.theme.accentColor).make(),
            item.desc.text.sm.make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: ["\$${item.price}".text.make(), AddToCart(item: item)],
            ).pOnly(right: 8)
          ],
        ))
      ],
    )).rounded.color(context.theme.cardColor).square(150).make().py12();
  }
}
