// To parse this JSON data, do
//
//     final address = addressFromJson(jsonString);

import 'dart:convert';

Address addressFromJson(String str) => Address.fromJson(json.decode(str));

String addressToJson(Address data) => json.encode(data.toJson());

class Address {
    List<Prediction> predictions;
    String status;

    Address({
        this.predictions,
        this.status,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        predictions: List<Prediction>.from(json["predictions"].map((x) => Prediction.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "predictions": List<dynamic>.from(predictions.map((x) => x.toJson())),
        "status": status,
    };
}

class Prediction {
    String name;
    String id;

    Prediction({
        this.name,
        this.id,
    });

    factory Prediction.fromJson(Map<String, dynamic> json) => Prediction(
        name: json["description"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "description": name,
        "id": id,
    };
    
    @override
    String toString() => name;

    @override
    operator ==(o) => o is Prediction && o.id == id;

    @override
    int get hashCode => id.hashCode^name.hashCode;
    
}
