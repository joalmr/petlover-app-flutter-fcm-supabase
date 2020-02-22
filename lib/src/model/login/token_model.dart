// To parse this JSON data, do
//
//     final tokenModel = tokenModelFromJson(jsonString);

import 'dart:convert';

TokenModel tokenModelFromJson(String str) => TokenModel.fromJson(json.decode(str));

String tokenModelToJson(TokenModel data) => json.encode(data.toJson());

class TokenModel {
    String token;
    String tokenType;
    DateTime expiresAt;

    TokenModel({
        this.token,
        this.tokenType,
        this.expiresAt,
    });

    factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        token: json["token"],
        tokenType: json["token_type"],
        expiresAt: DateTime.parse(json["expires_at"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "token_type": tokenType,
        "expires_at": expiresAt.toIso8601String(),
    };
}
