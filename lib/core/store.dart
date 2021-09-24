import 'package:flutter_course_practise/models/cart.dart';
import 'package:flutter_course_practise/models/myData.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late DataModel dataModel;
  late CartModel cart;

  MyStore() {
    dataModel = DataModel();
    cart = CartModel();
    cart.dataModel = dataModel;
  }
}
