/// option_id : "1"
/// id : "1"
/// options : "<string>"
/// text : "<string>"

class VotingBody {
  VotingBody({
    this.optionId,
    this.id,
    this.options,
    this.text,
  });

  VotingBody.fromJson(dynamic json) {
    optionId = json['option_id'];
    id = json['id'];
    options = json['options'];
    text = json['text'];
  }

  String? optionId;
  String? id;
  String? options;
  String? text;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['option_id'] = optionId;
    map['id'] = id;
    map['options'] = options;
    map['text'] = text;
    return map;
  }
}
