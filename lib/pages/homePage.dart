import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/core/store.dart';
import 'package:flutter_tutorial/models/cartModel.dart';
import 'package:flutter_tutorial/models/catelog.dart';
import 'package:flutter_tutorial/utils/routes.dart';
import 'package:flutter_tutorial/widgets/homeWidgets/catalogHeader.dart';
import 'package:flutter_tutorial/widgets/homeWidgets/catalogList.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// API
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

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
    // final catalogData =
    //     await rootBundle.loadString("assets/files/catalog.json");
    final response = await http.get(Uri.parse(url));

    final catalogData = response.body;

    final decodedData = jsonDecode(catalogData);
    var productsData = decodedData["products"];
    CatelogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    // final dummyList = List.generate(15, (index) => CatelogModel.items[0]);
    /* UI With default flutter 
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog Manager'),
      ),
      body: (CatelogModel.items != null && CatelogModel.items.isNotEmpty)
          ? Padding(
              padding: const EdgeInsets.all(12.0),
              /* Grid View */
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemCount: CatelogModel.items.length,
                  itemBuilder: (context, index) {
                    final item = CatelogModel.items[index];
                    return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: GridTile(
                        header: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(color: Colors.deepPurple),
                            child: Text(
                              item.name,
                              style: TextStyle(color: Colors.white),
                            )),
                        child: Image.network(item.image),
                        footer: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(color: Colors.black),
                            child: Text(
                              item.price.toString(),
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    );
                  }),
              /* List View */
              // child: ListView.builder(
              //     itemCount: CatelogModel.items.length,
              //     itemBuilder: (context, index) {
              //       return ItemWidget(item: CatelogModel.items[index]);
              //     }),
            )
          : Center(child: CircularProgressIndicator()),
      drawer: MyDrawer(),
    );
  }
 */

/* UI with velocity_x */
    return Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        floatingActionButton: VxBuilder(
          mutations: {AddMutation, RemoveMutation},
          builder: (ctx, store, _) => FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.cartRoute);
            },
            backgroundColor: context.theme.buttonColor,
            child: Icon(CupertinoIcons.cart),
          ).badge(color: Vx.red500, size: 20, count: _cart.items.length),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatelogModel.items != null && CatelogModel.items.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}
