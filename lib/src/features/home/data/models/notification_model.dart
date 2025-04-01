/// id : 2
/// user_id : 1
/// text : "{\"en\": \"sdsdsd\", \"oz\": \"dsdsd\", \"ru\": \"sddsd\", \"uz\": \"dfdfdf\"}"
/// document_code : "668401a51d464c0001ab3e3d"
/// description : "mmmmmmasdasd"
/// status : "2"
/// read_at : null
/// created_at : "2024-07-02T13:33:49.000000Z"
/// updated_at : "2024-07-02T13:33:49.000000Z"

class NotificationModel {
  NotificationModel({
    this.id,
    this.userId,
    this.text,
    this.documentCode,
    this.description,
    this.status,
    this.readAt,
    this.createdAt,
    this.updatedAt,
  });

  NotificationModel.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    text = json['text'];
    documentCode = json['document_code'];
    description = json['description'];
    status = json['status'];
    readAt = json['read_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  int? id;
  int? userId;
  String? text;
  String? documentCode;
  String? description;
  String? status;
  String? readAt;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['text'] = text;
    map['document_code'] = documentCode;
    map['description'] = description;
    map['status'] = status;
    map['read_at'] = readAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
