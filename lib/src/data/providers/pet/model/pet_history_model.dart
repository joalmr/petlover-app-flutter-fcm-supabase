class PetHistoryModel {
  String attentionId;
  String attentionDate;
  dynamic attentionDetails;
  String attentionAmount;
  String attentionBonification;
  String establishmentLogo;
  String establishmentName;

  PetHistoryModel(
      {this.attentionId,
      this.attentionDate,
      this.attentionDetails,
      this.attentionAmount,
      this.attentionBonification,
      this.establishmentLogo,
      this.establishmentName});

  factory PetHistoryModel.fromJson(Map<String, dynamic> json) =>
      PetHistoryModel(
        attentionId: json['attention_id'],
        attentionDate: json['attention_date'].toString(),
        attentionDetails: json['attention_details'] ?? null,
        attentionAmount: json['attention_amount'].toString(),
        attentionBonification: json['attention_bonification'].toString(),
        establishmentLogo: json['establishment_logo'],
        establishmentName: json['establishment_name'],
      );

  Map<String, dynamic> toJson() => {
        'attention_id': attentionId,
        'attention_date': attentionDate,
        'attention_details': attentionDetails.toJson(),
        'attention_amount': attentionAmount,
        'attention_bonification': attentionBonification,
        'establishment_logo': establishmentLogo,
        'establishment_name': establishmentName,
      };
}
