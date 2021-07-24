import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tutorial/models/catelog.dart';
import 'package:flutter_tutorial/widgets/drawer.dart';
import 'package:flutter_tutorial/widgets/items.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// invokes before rendering -> like componentDidMount()
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

// Using for making API/local file call
  loadData() async {
    // just for loader, ignorable
    await Future.delayed(Duration(seconds: 3));
    final catalogData =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogData);
    var productsData = decodedData["products"];
    CatelogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(15, (index) => CatelogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog Manager'),
      ),
      body: (CatelogModel.items != null && CatelogModel.items.isNotEmpty)
          ? Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                  itemCount: CatelogModel.items.length,
                  itemBuilder: (context, index) {
                    return ItemWidget(item: CatelogModel.items[index]);
                  }),
            )
          : Center(child: CircularProgressIndicator()),
      drawer: MyDrawer(),
    );
  }
}
