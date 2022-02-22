import 'dart:convert';

class Product {
    Product({
        required this.available,
        required this.name,
        required this.picture,
        required this.city,
        this.id
    });

    bool available;
    String name;
    String picture;
    String city;
    String? id;

    factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Product.fromMap(Map<String, dynamic> json) => Product(
        available: json["available"],
        name: json["name"],
        picture: json["picture"],
        city: json["city"],
    );

    Map<String, dynamic> toMap() => {
        "available": available,
        "name": name,
        "picture": picture,
        "city": city,
    };

    Product copy() => Product(
      available: this.available,
      name: this.name,
      picture: this.picture,
      city: this.city,
      id: this.id,
    );

}
