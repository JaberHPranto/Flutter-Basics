import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/catelog.dart';
import 'package:flutter_tutorial/widgets/drawer.dart';
import 'package:flutter_tutorial/widgets/items.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(15, (index) => CatelogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory Manager'),
      ),
      body: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(item: dummyList[index]);
          }),
      drawer: MyDrawer(),
    );
  }
}
