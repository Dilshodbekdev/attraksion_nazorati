/// value : "15"
/// label : "Samarqand viloyati"

class AttractionModel {
  AttractionModel({
      this.value, 
      this.label,
      this.image,
  });

  AttractionModel.fromJson(dynamic json) {
    value = json['value'];
    label = json['label'];
    image = json['image'];
  }
  int? value;
  String? label;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['label'] = label;
    map['image'] = image;
    return map;
  }

}