import 'package:flutter/cupertino.dart';
import 'package:flutter_course_practise/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class DataImage extends StatelessWidget {
  final String image;

  const DataImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .color(context.canvasColor)
        .make()
        .p16()
        .w32(context);
  }
}
