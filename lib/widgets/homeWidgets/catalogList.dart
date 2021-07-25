import 'package:flutter/cupertino.dart';
import 'package:flutter_tutorial/models/catelog.dart';

import 'catalogItem.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatelogModel.items.length,
        itemBuilder: (context, index) {
          final item = CatelogModel.items[index];
          return CatalogItem(item: item);
        });
  }
}
