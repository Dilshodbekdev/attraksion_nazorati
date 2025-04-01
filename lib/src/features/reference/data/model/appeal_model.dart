/// id : 31
/// invoice_number : 10031
/// region : {"value":1,"label":"Samarqand viloyati"}
/// district : {"value":1,"label":"Oqdaryo tumani"}
/// description : "text"
/// park : {"value":1,"label":"Amir Temur istirohat bog'i"}
/// attraction : {"value":1,"label":"Zanjirli karusel","image":"https://att.technocorp.uz//media/image/%D0%A6%D0%B5%D0%BF%D0%BE%D1%87%D0%BD%D0%B0%D1%8F.jpg"}
/// offense_types : [{"value":1,"label":"Attraksion passporti mavjud emas"}]
/// status : {"label":0,"value":"Yangi"}
/// created_at : "2024-09-05T15:41:48.949264"

class AppealModel {
  AppealModel({
      this.id, 
      this.invoiceNumber, 
      this.region, 
      this.district, 
      this.description, 
      this.park, 
      this.attraction, 
      this.offenseTypes, 
      this.status, 
      this.createdAt,});

  AppealModel.fromJson(dynamic json) {
    id = json['id'];
    invoiceNumber = json['invoice_number'];
    region = json['region'] != null ? Region.fromJson(json['region']) : null;
    district = json['district'] != null ? District.fromJson(json['district']) : null;
    description = json['description'];
    park = json['park'] != null ? Park.fromJson(json['park']) : null;
    attraction = json['attraction'] != null ? Attraction.fromJson(json['attraction']) : null;
    if (json['offense_types'] != null) {
      offenseTypes = [];
      json['offense_types'].forEach((v) {
        offenseTypes?.add(OffenseTypes.fromJson(v));
      });
    }
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    createdAt = json['created_at'];
  }
  int? id;
  int? invoiceNumber;
  Region? region;
  District? district;
  String? description;
  Park? park;
  Attraction? attraction;
  List<OffenseTypes>? offenseTypes;
  Status? status;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['invoice_number'] = invoiceNumber;
    if (region != null) {
      map['region'] = region?.toJson();
    }
    if (district != null) {
      map['district'] = district?.toJson();
    }
    map['description'] = description;
    if (park != null) {
      map['park'] = park?.toJson();
    }
    if (attraction != null) {
      map['attraction'] = attraction?.toJson();
    }
    if (offenseTypes != null) {
      map['offense_types'] = offenseTypes?.map((v) => v.toJson()).toList();
    }
    if (status != null) {
      map['status'] = status?.toJson();
    }
    map['created_at'] = createdAt;
    return map;
  }

}

/// label : 0
/// value : "Yangi"

class Status {
  Status({
      this.label, 
      this.value,});

  Status.fromJson(dynamic json) {
    label = json['label'];
    value = json['value'];
  }
  int? label;
  String? value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['value'] = value;
    return map;
  }

}

/// value : 1
/// label : "Attraksion passporti mavjud emas"

class OffenseTypes {
  OffenseTypes({
      this.value, 
      this.label,});

  OffenseTypes.fromJson(dynamic json) {
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

/// value : 1
/// label : "Zanjirli karusel"
/// image : "https://att.technocorp.uz//media/image/%D0%A6%D0%B5%D0%BF%D0%BE%D1%87%D0%BD%D0%B0%D1%8F.jpg"

class Attraction {
  Attraction({
      this.value, 
      this.label, 
      this.image,});

  Attraction.fromJson(dynamic json) {
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

/// value : 1
/// label : "Amir Temur istirohat bog'i"

class Park {
  Park({
      this.value, 
      this.label,});

  Park.fromJson(dynamic json) {
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

/// value : 1
/// label : "Oqdaryo tumani"

class District {
  District({
      this.value, 
      this.label,});

  District.fromJson(dynamic json) {
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

/// value : 1
/// label : "Samarqand viloyati"

class Region {
  Region({
      this.value, 
      this.label,});

  Region.fromJson(dynamic json) {
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