import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_course_practise/models/myData.dart';
import 'package:flutter_course_practise/widgets/drawer.dart';
import 'package:flutter_course_practise/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var dataJson = await rootBundle.loadString('assets/files/mydata.json');
    var decodedData = jsonDecode(dataJson);
    var productData = decodedData["products"];

    setState(() {
      DataModel.items = List.from(productData)
          .map<Item>((item) => Item.fromMap(item))
          .toList();
    });
    // print(productData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Catalog App',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: (DataModel.items != null && DataModel.items.isNotEmpty)
            ? ListView.builder(
                itemCount: DataModel.items.length,
                itemBuilder: (context, index) {
                  return ItemWidget(
                    item: DataModel.items[index],
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
