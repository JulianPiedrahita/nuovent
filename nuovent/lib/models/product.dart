import 'dart:convert';

class Product {
    Product({
        required this.available,
        required this.description,
        required this.nomAnounce,
        required this.numCapacity,
        required this.picture,
        required this.city,
        this.id
    });

    bool available;
    String description;
    String nomAnounce;
    String numCapacity;
    String picture;
    String city;
    String? id;

    factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Product.fromMap(Map<String, dynamic> json) => Product(
        available: json["available"],
        description: json["description"],
        picture: json["picture"],
        nomAnounce: json["nomAnounce"],
        numCapacity: json["numCapacity"],
        city: json["city"],
    );

    Map<String, dynamic> toMap() => {
        "available": available,
        "description": description,
        "nomAnounce": nomAnounce,
        "numCapacity": numCapacity,
        "picture": picture,
        "city": city,
    };

    Product copy() => Product(
      available: this.available,
      description: this.description,
      nomAnounce: this.nomAnounce,
      numCapacity: this.numCapacity,
      picture: this.picture,
      city: this.city,
      id: this.id,
    );

}
