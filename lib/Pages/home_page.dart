import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_course_practise/core/store.dart';
import 'dart:convert';
import 'package:flutter_course_practise/models/myData.dart';
import 'package:flutter_course_practise/utils/myrouts.dart';
import 'package:flutter_course_practise/widgets/homeWidgets/catalogHeader.dart';
import 'package:flutter_course_practise/widgets/homeWidgets/dataList.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var dataJson = await rootBundle.loadString('assets/files/mydata.json');

    // var response = await http.get(Uri.parse(url));
    // final dataJson = response.body;
    var decodedData = jsonDecode(dataJson);
    var productData = decodedData["products"];

    setState(() {
      DataModel.items = List.from(productData)
          .map<Item>((item) => Item.fromMap(item))
          .toList();
    });
    // print(productData);
  }

  btnCart(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: context.theme.buttonColor,
          child: const Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ) /*.badge(
          size: 18,
          count: _cart.items.length,
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),*/

        // floatingActionButton: VxBuilder(
        //   mutations: {AddMutation, RemoveMutation},
        //   builder: (context, _) => FloatingActionButton(
        //     onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        //     backgroundColor: context.theme.buttonColor,
        //     child: const Icon(
        //       CupertinoIcons.cart,
        //       color: Colors.white,
        //     ),
        //   ).badge(
        //     size: 18,
        //     count: _cart.items.length,
        //     textStyle: TextStyle(
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        // ),
        ,
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
