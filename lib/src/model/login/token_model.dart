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
    dynamic verify;

    TokenModel({
        this.token,
        this.tokenType,
        this.expiresAt,
        this.verify,
    });

    factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        token: json["token"],
        tokenType: json["token_type"],
        expiresAt: DateTime.parse(json["expires_at"]),
        verify: json["verify"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "token_type": tokenType,
        "expires_at": expiresAt.toIso8601String(),
    };
}
