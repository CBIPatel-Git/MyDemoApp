import 'package:flutter_course_practise/core/store.dart';
import 'package:flutter_course_practise/models/myData.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  //DataList field
  late DataModel _dataModel;

  // Collection of ids - store ids of each item
  final List<int> _itemIds = [];

  //get dataItems
  DataModel get dataModel => _dataModel;

  set dataModel(DataModel newDataModel) {
    _dataModel = newDataModel;
  }

  //get items in the cart
  List<Item> get items => _itemIds.map((id) => _dataModel.getById(id)).toList();

  //get Total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // //Remove Item
  // void add(Item item) {
  //   _itemIds.add(item.id);
  // }

}

//Add Item
class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
    // TODO: implement perform
    store!.cart._itemIds.add(item.id);
  }
}

//Remove Item
class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  RemoveMutation(this.item);
  @override
  perform() {
    // TODO: implement perform
    store!.cart._itemIds.remove(item.id);
  }
}
