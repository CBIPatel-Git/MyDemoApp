class DataModel {
  static List<Item> items = [
    // Item(
    //     id: 1,
    //     name: "iPhone 12 Pro",
    //     desc: "Apple iPhone 12th generation",
    //     price: 999,
    //     color: "#33505a",
    //     big_desc:
    //         "Apple’s recently launched iPhone 13 series includes four smartphones, ranging from the iPhone 13 Mini to the iPhone 13 Pro Max. The designs are unchanged compared to those of their predecessors, except for a smaller notch and a re-aligned camera setup for the two smaller iPhones.",
    //     image:
    //         "https://shop.jtglobal.com/wp-content/uploads/2020/10/iphone-12-pro-pacific-blue.jpg")
  ];

  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String big_desc;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.big_desc,
      required this.image});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      big_desc: map["big_desc"],
      image: map["image"],
    );
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "big_desc": big_desc,
        "image": image,
      };
}
