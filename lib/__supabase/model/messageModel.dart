class MessageModel {
    MessageModel({
      this.id,
      this.canalId,
      this.message,
      this.type,
    });

    int id;
    int canalId;
    String message;
    bool type;

    factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        id: json["id"],
        canalId: json["canal_id"],
        message: json["message"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "canal_id": canalId,
        "message": message,
        "type": type,
    };
}
