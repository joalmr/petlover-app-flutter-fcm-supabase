class PetHistoryModel {
  String attentionId;
  String attentionDate;
  dynamic attentionDetails;
  String attentionBonification;
  String establishmentLogo;
  String establishmentName;

  PetHistoryModel(
      {this.attentionId,
      this.attentionDate,
      this.attentionDetails,
      this.attentionBonification,
      this.establishmentLogo,
      this.establishmentName});

  factory PetHistoryModel.fromJson(Map<String, dynamic> json) =>
      PetHistoryModel(
        attentionId: json['attention_id'],
        attentionDate: json['attention_date'].toString(),
        // DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").parse(json['attention_date']),
        attentionDetails: json['attention_details'] ?? null,
        attentionBonification: json['attention_bonification'].toString(),
        establishmentLogo: json['establishment_logo'],
        establishmentName: json['establishment_name'],
      );

  Map<String, dynamic> toJson() => {
        'attention_id': attentionId,
        'attention_date': attentionDate,
        'attention_details': attentionDetails.toJson(),
        'attention_bonification': attentionBonification,
        'establishment_logo': establishmentLogo,
        'establishment_name': establishmentName,
      };
}
