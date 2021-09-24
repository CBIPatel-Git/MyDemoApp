import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_practise/Pages/home_detail_page.dart';
import 'package:flutter_course_practise/models/myData.dart';
import 'package:velocity_x/velocity_x.dart';

import 'add_to_cart.dart';
import 'dataImage.dart';

class DataList extends StatelessWidget {
  const DataList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final myDataItems = DataModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(itemDetails: myDataItems),
            ),
          ),
          child: DataItem(myDataItems),
        );
      },
      itemCount: DataModel.items.length,
    );
  }
}

class DataItem extends StatelessWidget {
  final Item dataItem;

  const DataItem(this.dataItem, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(dataItem.id.toString()),
            child: DataImage(
              image: dataItem.image,
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dataItem.name.text.lg
                  .color(context.theme.accentColor)
                  .bold
                  .make(),
              dataItem.desc.text.size(12).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${dataItem.price}".text.bold.xl.make(),
                  AddToCart(dataItem)
                ],
              ).pOnly(right: 8.0),
            ],
          ))
        ],
      ),
    ).color(context.cardColor).square(150).rounded.make().py(16);
  }
}
