// To parse this JSON data, do
//
//     final client = clientFromJson(jsonString);

import 'dart:convert';

Client clientFromJson(String str) => Client.fromJson(json.decode(str));

String clientToJson(Client data) => json.encode(data.toJson());

class Client {
    Client({
        this.id,
        this.titulo,
        this.valor,
        this.disponible,
        this.fotoUrl,
    });

    String id;
    String titulo;
    double valor;
    bool disponible;
    String fotoUrl;

    factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["id"],
        titulo: json["titulo"],
        valor: json["valor"],
        disponible: json["disponible"],
        fotoUrl: json["fotoUrl"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "valor": valor,
        "disponible": disponible,
        "fotoUrl": fotoUrl,
    };
}
