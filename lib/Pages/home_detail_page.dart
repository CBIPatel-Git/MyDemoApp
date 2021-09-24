import 'package:flutter/material.dart';
import 'package:flutter_course_practise/models/myData.dart';
import 'package:flutter_course_practise/widgets/homeWidgets/add_to_cart.dart';
import 'package:flutter_course_practise/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item itemDetails;

  const HomeDetailPage({required this.itemDetails, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.canvasColor,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.zero,
        children: [
          "\$${itemDetails.price}".text.bold.xl3.color(Colors.green).make(),
          AddToCart(itemDetails).wh(120, 40),
        ],
      ).p16().backgroundColor(context.cardColor),
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
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        itemDetails.name.text.xl4
                            .color(context.accentColor)
                            .bold
                            .make(),
                        itemDetails.desc.text.size(14).xl.make(),
                        10.heightBox,
                        itemDetails.big_desc.text.size(14).make().p16(),
                      ],
                    ).py64(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
