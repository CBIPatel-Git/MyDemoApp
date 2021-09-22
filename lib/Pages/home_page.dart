import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_course_practise/models/myData.dart';
import 'package:flutter_course_practise/widgets/homeWidgets/catalogHeader.dart';
import 'package:flutter_course_practise/widgets/homeWidgets/dataList.dart';
import 'package:flutter_course_practise/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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
        backgroundColor: MyTheme.creamColor,
        body: SafeArea(
          bottom: false,
          child: Container(
            padding: Vx.m8,
            child: Column(
              children: [
                CatalogHeader(),
                if (DataModel.items != null && DataModel.items.isNotEmpty)
                  DataList().py16().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}
