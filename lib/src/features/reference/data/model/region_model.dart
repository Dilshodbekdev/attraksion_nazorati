/// value : "15"
/// label : "Samarqand viloyati"

class RegionModel {
  RegionModel({
      this.value, 
      this.label,});

  RegionModel.fromJson(dynamic json) {
    value = json['value'];
    label = json['label'];
  }
  int? value;
  String? label;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['label'] = label;
    return map;
  }

}