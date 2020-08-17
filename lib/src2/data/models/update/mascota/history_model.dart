class HistoriaModel2 {
  String attentionId;
  String establishmentId;
  String establishment;
  String establishmentLogo;
  String weight;
  String heartRhythm;
  String temperature;
  String bodyCondition;
  String createdAt;
  dynamic amount;
  String nextdate;
  String reason;
  dynamic details;

  HistoriaModel2({
    this.attentionId,
    this.establishmentId,
    this.establishment,
    this.establishmentLogo,
    this.weight,
    this.heartRhythm,
    this.temperature,
    this.bodyCondition,
    this.createdAt,
    this.amount,
    this.nextdate,
    this.reason,
    this.details,
  });

  factory HistoriaModel2.fromJson(Map<String, dynamic> json) => HistoriaModel2(
        attentionId: json["attention_id"],
        establishmentId: json["establishment_id"],
        establishment: json["establishment"],
        establishmentLogo: json["establishment_logo"],
        weight: json["weight"].toString(), //.toDouble(),
        heartRhythm: json["heart_rhythm"].toString(), //.toDouble(),
        temperature: json["temperature"].toString(), //.toDouble(),
        bodyCondition: json["body_condition"],
        createdAt: json["created_at"],
        amount: json["amount"] == null ? 0 : json["amount"],
        nextdate: json["nextdate"] == null ? "" : json["nextdate"],
        reason: json["reason"] == null ? "" : json["reason"],
        details: json["details"], //List<dynamic>.from(json["details"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "attention_id": attentionId,
        "establishment_id": establishmentId,
        "establishment": establishment,
        "establishment_logo": establishmentLogo,
        "weight": weight,
        "heart_rhythm": heartRhythm,
        "temperature": temperature,
        "body_condition": bodyCondition,
        "created_at": createdAt,
        // "details": List<dynamic>.from(details.map((x) => x)),
      };
}
// import 'package:get/get.dart';

// class RxHistoriaModel {
//   final RxString attentionId;
//   final RxString establishmentId;
//   final RxString establishment;
//   final RxString establishmentLogo;
//   final RxString weight;
//   final RxString heartRhythm;
//   final RxString temperature;
//   final RxString bodyCondition;
//   final RxString createdAt;
//   final dynamic amount; //
//   final RxString nextdate;
//   final RxString reason;
//   final dynamic details; //

//   RxHistoriaModel(
//     this.attentionId,
//     this.establishmentId,
//     this.establishment,
//     this.establishmentLogo,
//     this.weight,
//     this.heartRhythm,
//     this.temperature,
//     this.bodyCondition,
//     this.createdAt,
//     this.amount, //
//     this.nextdate,
//     this.reason,
//     this.details, //
//   );
// }

// class HistoriaModel2 {
//   String attentionId;
//   String establishmentId;
//   String establishment;
//   String establishmentLogo;
//   String weight;
//   String heartRhythm;
//   String temperature;
//   String bodyCondition;
//   String createdAt;
//   dynamic amount;
//   String nextdate;
//   String reason;
//   dynamic details;

//   RxHistoriaModel rx;
//   HistoriaModel2({
//     this.attentionId,
//     this.establishmentId,
//     this.establishment,
//     this.establishmentLogo,
//     this.weight,
//     this.heartRhythm,
//     this.temperature,
//     this.bodyCondition,
//     this.createdAt,
//     this.amount,
//     this.nextdate,
//     this.reason,
//     this.details,
//   }) {
//     rx = RxHistoriaModel(
//       attentionId.obs,
//       establishmentId.obs,
//       establishment.obs,
//       establishmentLogo.obs,
//       weight.obs,
//       heartRhythm.obs,
//       temperature.obs,
//       bodyCondition.obs,
//       createdAt.obs,
//       amount.obs,
//       nextdate.obs,
//       reason.obs,
//       details.obs,
//     );
//   }

//   factory HistoriaModel2.fromJson(Map<String, dynamic> json) => HistoriaModel2(
//         attentionId: json["attention_id"],
//         establishmentId: json["establishment_id"],
//         establishment: json["establishment"],
//         establishmentLogo: json["establishment_logo"],
//         weight: json["weight"].toString(), //.toDouble(),
//         heartRhythm: json["heart_rhythm"].toString(), //.toDouble(),
//         temperature: json["temperature"].toString(), //.toDouble(),
//         bodyCondition: json["body_condition"],
//         createdAt: json["created_at"],
//         amount: json["amount"] == null ? 0 : json["amount"],
//         nextdate: json["nextdate"] == null ? "" : json["nextdate"],
//         reason: json["reason"] == null ? "" : json["reason"],
//         details: json["details"], //List<dynamic>.from(json["details"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "attention_id": attentionId,
//         "establishment_id": establishmentId,
//         "establishment": establishment,
//         "establishment_logo": establishmentLogo,
//         "weight": weight,
//         "heart_rhythm": heartRhythm,
//         "temperature": temperature,
//         "body_condition": bodyCondition,
//         "created_at": createdAt,
//         // "details": List<dynamic>.from(details.map((x) => x)),
//       };
// }
