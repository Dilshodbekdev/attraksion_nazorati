/// message : ""

class SentVoteModel {
  SentVoteModel({
    this.message,
  });

  SentVoteModel.fromJson(dynamic json) {
    message = json['message'];
  }

  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    return map;
  }
}
