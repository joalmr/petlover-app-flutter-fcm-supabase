//     final grooming = groomingFromJson(jsonString);
import 'dart:convert';

Grooming groomingFromJson(String str) => Grooming.fromJson(json.decode(str));
String groomingToJson(Grooming data) => json.encode(data.toJson());

class Grooming {
    dynamic groomings;
    String recommendations;
    String employeeId;
    double amount;

    Grooming({
        this.groomings,
        this.recommendations,
        this.employeeId,
        this.amount,
    });

    factory Grooming.fromJson(Map<String, dynamic> json) => Grooming(
        groomings: json["groomings"]==null ? "" : json["groomings"],
        recommendations: json["recommendations"]==null ? "" : json["recommendations"],
        employeeId: json["employee_id"]==null ? "" : json["employee_id"],
        amount: json["amount"].toDouble()==null ? 0 : json["amount"],
    );

    Map<String, dynamic> toJson() => {
        "groomings": groomings,
        "recommendations": recommendations,
        "employee_id": employeeId,
        "amount": amount,
    };
}
