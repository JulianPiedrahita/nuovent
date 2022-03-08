import 'dart:convert';

class Accommodation{
    Accommodation({
        required this.categoria,
        required this.ciudad,
        required this.descripcion,
        required this.direccion,
        required this.email,
        required this.nit,
        required this.nombrealojamiento,
        required this.proveedor,
        required this.responsable,
        required this.telefono,
        this.id
    });

 
    String categoria;
    String ciudad;
    String descripcion;
    String direccion;
    String email;
    String nit;
    String nombrealojamiento;
    String proveedor;
    String responsable;
        String telefono;

    String? id;

    factory Accommodation.fromJson(String str) => Accommodation.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Accommodation.fromMap(Map<String, dynamic> json) => Accommodation(

        categoria: json["categoria"],
        ciudad: json["ciudad"],
        descripcion: json["descripcion"],
        direccion: json["direccion"],
        email: json["email"],
        nit: json["nit"],
        nombrealojamiento: json["nombrealojamiento"],
        proveedor: json["proveedor"],
        responsable: json["responsable"],
        telefono: json["telefono"],
    );

    Map<String, dynamic> toMap() => {
        "categoria": categoria,
        "ciudad": ciudad,
        "descripcion": descripcion,
        "email": email,
        "nit": nit,
        "nombrealojamiento": nombrealojamiento,
        "proveedor": proveedor,
        "responsable": responsable,
        "telefono": telefono,
    };

    Accommodation copy() => Accommodation(
      categoria: this.categoria,
      ciudad: this.ciudad,
      descripcion: this.descripcion,
      direccion: this.direccion,
      email: this.email,
      nit: this.nit,
      id: this.id,
      nombrealojamiento: this.nombrealojamiento,
      proveedor: this.proveedor,
      responsable: this.responsable,
      telefono: this.telefono,
    );

}
