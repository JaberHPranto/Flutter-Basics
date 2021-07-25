import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetails extends StatelessWidget {
  final Item item;
  const HomeDetails({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${item.price}".text.xl2.red900.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            context.theme.buttonColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Buy".text.make())
                .wh(100, 50)
          ],
        ).p16(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(tag: Key(item.id.toString()), child: Image.network(item.image))
                .h40(context)
                .px12(),
            Expanded(
                child: VxArc(
              height: 30,
              edge: VxEdge.TOP,
              arcType: VxArcType.CONVEY,
              child: Container(
                color: context.cardColor,
                width: context.screenWidth,
                child: Column(
                  children: [
                    item.name.text.xl4.bold
                        .color(context.theme.accentColor)
                        .make(),
                    item.desc.text.light.xl.make(),
                    20.heightBox,
                    "Lorem ipsum nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium q dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligulas eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, utate"
                        .text
                        .medium
                        .make()
                        .p16()
                        .expand()
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
