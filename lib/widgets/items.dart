import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/catelog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  // ignore: unnecessary_null_comparison
  const ItemWidget({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          onTap: () {
            print('Tapped');
          },
          leading: Image.network(item.image),
          title: Text(item.name),
          subtitle: Text(item.desc),
          trailing: Text(
            "\$${item.price}",
            textScaleFactor: 1.2,
            style: TextStyle(
                color: Colors.deepPurple, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

// Image.network(item.image)