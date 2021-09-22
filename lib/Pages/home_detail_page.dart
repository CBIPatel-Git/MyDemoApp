import 'package:flutter/material.dart';
import 'package:flutter_course_practise/models/myData.dart';
import 'package:flutter_course_practise/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item itemDetails;

  const HomeDetailPage({Key? key, required this.itemDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.zero,
        children: [
          "\$${itemDetails.price}".text.bold.xl3.color(Colors.green).make(),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              shape: MaterialStateProperty.all(StadiumBorder()),
            ),
            child: "Buy".text.center.size(18).make(),
          ).wh(80, 40),
        ],
      ).p16().backgroundColor(Colors.white),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(itemDetails.id.toString()),
              child: Image.network(itemDetails.image),
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              edge: VxEdge.TOP,
              arcType: VxArcType.CONVEY,
              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    itemDetails.name.text.xl4
                        .color(MyTheme.darkGreenColor)
                        .bold
                        .make(),
                    itemDetails.desc.text.size(12).xl.make(),
                    10.heightBox,
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
