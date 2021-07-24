class CatelogModel {
  static final items = [
    Item(1, "Iphone 12 pro max", "This is iphone 12 pro max phone", 1100,
        "https://www.mytrendyphone.eu/images/iPhone-12-Pro-Max-128GB-Graphite-0194252021200-25102020-1-p.jpg")
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final int price;
  final String image;

  Item(this.id, this.name, this.desc, this.price, this.image);
}
