class CatelogModel {
  static List<Item> items = [];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String image;
  final String color;

  Item(
    this.id,
    this.name,
    this.desc,
    this.price,
    this.image,
    this.color,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'image': image,
      'color': color,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      map['id'],
      map['name'],
      map['desc'],
      map['price'],
      map['image'],
      map['color'],
    );
  }
}
