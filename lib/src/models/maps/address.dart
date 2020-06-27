// To parse this JSON data, do
//
//     final address = addressFromJson(jsonString);

import 'dart:convert';

Address addressFromJson(String str) => Address.fromJson(json.decode(str));

String addressToJson(Address data) => json.encode(data.toJson());

class Address {
    List<Prediction2> predictions;
    String status;

    Address({
        this.predictions,
        this.status,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        predictions: List<Prediction2>.from(json["predictions"].map((x) => Prediction2.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "predictions": List<dynamic>.from(predictions.map((x) => x.toJson())),
        "status": status,
    };
}

class Prediction2 {
    String name;
    String id;
    String placeId;

    Prediction2({
        this.name,
        this.id,
        this.placeId,
    });

    factory Prediction2.fromJson(Map<String, dynamic> json) => Prediction2(
        name: json["description"],
        id: json["id"],
        placeId: json["place_id"],
    );

    Map<String, dynamic> toJson() => {
        "description": name,
        "id": id,
    };
    
    @override
    String toString() => name;

    @override
    operator ==(o) => o is Prediction2 && o.id == id;

    @override
    int get hashCode => id.hashCode^name.hashCode;
    
}


// class Prediction {
//     String description;
//     String placeId;
//     String geolocation;

//     Prediction({
//         this.description,
//         this.placeId,
//         this.geolocation,
//     });

//     factory Prediction.fromJson(Map<String, dynamic> json) => Prediction(
//         description: json["description"],
//         placeId: json["place_id"],
//         geolocation: json["geolocation"],
//     );
    
// }

