import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/catelog.dart';
import 'package:flutter_tutorial/pages/homeDetailsPage.dart';

import 'catalogItem.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatelogModel.items.length,
        itemBuilder: (context, index) {
          final item = CatelogModel.getItemByPosition(index);
          return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeDetails(item: item)));
              },
              child: CatalogItem(item: item));
        });
  }
}
