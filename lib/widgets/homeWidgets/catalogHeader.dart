import 'package:flutter/material.dart';
import 'package:flutter_course_practise/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.bold.xl5.color(MyTheme.darkGreenColor).make(),
        "Tranding Products".text.size(16).make(),
      ],
    );
  }
}
