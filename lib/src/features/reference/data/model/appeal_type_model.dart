/// id : 1
/// label : "{\"oz\":\"/ personal rights and freedoms\"}"
/// value : 1
/// parent_id : 0

class AppealTypeModel {
  AppealTypeModel({
    this.id,
    this.label,
    this.value,
    this.parentId,
  });

  AppealTypeModel.fromJson(dynamic json) {
    id = json['id'];
    label = json['label'];
    value = json['value'];
    parentId = json['parent_id'];
  }

  int? id;
  String? label;
  int? value;
  int? parentId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['label'] = label;
    map['value'] = value;
    map['parent_id'] = parentId;
    return map;
  }
}
