import 'package:flutter/material.dart';
import 'package:flutter_tutorial/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String language = 'flutter';
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory Manager'),
      ),
      body:
          Center(child: Container(child: Text('I am now learning $language'))),
      drawer: MyDrawer(),
    );
  }
}
