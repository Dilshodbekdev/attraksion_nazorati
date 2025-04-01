/// id : 35
/// invoice_number : 10035
/// description : "text"
/// region : {"value":1,"label":"Samarqand viloyati"}
/// district : {"value":1,"label":"Oqdaryo tumani"}
/// attraction : {"value":1,"label":"Zanjirli karusel","image":"https://att.technocorp.uz//media/image/%D0%A6%D0%B5%D0%BF%D0%BE%D1%87%D0%BD%D0%B0%D1%8F.jpg"}
/// park : {"value":1,"label":"Amir Temur istirohat bog'i"}
/// offense_types : [{"value":1,"label":"Attraksion passporti mavjud emas"}]
/// docs : [{"id":15,"src":"https://att.technocorp.uz//media/docs/uz-ru_mVnZEdn.docx"},{"id":16,"src":"https://att.technocorp.uz//media/docs/Attraksion_nazorati_malumot_iAopoAq.docx"}]
/// images : [{"id":15,"image":"https://att.technocorp.uz//media/image/card_mask_1_ovaK3yK.png"},{"id":16,"image":"https://att.technocorp.uz//media/image/card_mask_1_4Zfv7Me.png"}]
/// status : {"label":0,"value":"Yangi"}
/// created_by : "NURULLAYEV DILSHOD INATILLO UG‘LI"
/// answer : {"answer":null,"responsible_department":null,"executive":null,"files":[{"id":16,"src":"https://att.technocorp.uz//media/docs/Attraksion_nazorati_malumot_iAopoAq.docx"}]}
/// created_at : "2024-09-05T17:14:21.219417"
/// proccess_date : null

class CreateAppealModel {
  CreateAppealModel({
    this.id,
    this.invoiceNumber,
    this.description,
    this.region,
    this.district,
    this.attraction,
    this.park,
    this.offenseTypes,
    this.docs,
    this.images,
    this.status,
    this.createdBy,
    this.answer,
    this.createdAt,
    this.proccessDate,
  });

  CreateAppealModel.fromJson(dynamic json) {
    id = json['id'];
    invoiceNumber = json['invoice_number'];
    description = json['description'];
    region = json['region'] != null ? Region.fromJson(json['region']) : null;
    district =
        json['district'] != null ? District.fromJson(json['district']) : null;
    attraction = json['attraction'] != null
        ? Attraction.fromJson(json['attraction'])
        : null;
    park = json['park'] != null ? Park.fromJson(json['park']) : null;
    if (json['offense_types'] != null) {
      offenseTypes = [];
      json['offense_types'].forEach((v) {
        offenseTypes?.add(OffenseTypes.fromJson(v));
      });
    }
    if (json['docs'] != null) {
      docs = [];
      json['docs'].forEach((v) {
        docs?.add(Docs.fromJson(v));
      });
    }
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(Images.fromJson(v));
      });
    }
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
    createdBy = json['created_by'];
    answer = json['answer'] != null ? Answer.fromJson(json['answer']) : null;
    createdAt = json['created_at'];
    proccessDate = json['proccess_date'];
  }

  int? id;
  int? invoiceNumber;
  String? description;
  Region? region;
  District? district;
  Attraction? attraction;
  Park? park;
  List<OffenseTypes>? offenseTypes;
  List<Docs>? docs;
  List<Images>? images;
  Status? status;
  String? createdBy;
  Answer? answer;
  String? createdAt;
  dynamic proccessDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['invoice_number'] = invoiceNumber;
    map['description'] = description;
    if (region != null) {
      map['region'] = region?.toJson();
    }
    if (district != null) {
      map['district'] = district?.toJson();
    }
    if (attraction != null) {
      map['attraction'] = attraction?.toJson();
    }
    if (park != null) {
      map['park'] = park?.toJson();
    }
    if (offenseTypes != null) {
      map['offense_types'] = offenseTypes?.map((v) => v.toJson()).toList();
    }
    if (docs != null) {
      map['docs'] = docs?.map((v) => v.toJson()).toList();
    }
    if (images != null) {
      map['images'] = images?.map((v) => v.toJson()).toList();
    }
    if (status != null) {
      map['status'] = status?.toJson();
    }
    map['created_by'] = createdBy;
    if (answer != null) {
      map['answer'] = answer?.toJson();
    }
    map['created_at'] = createdAt;
    map['proccess_date'] = proccessDate;
    return map;
  }
}

/// answer : null
/// responsible_department : null
/// executive : null
/// files : [{"id":16,"src":"https://att.technocorp.uz//media/docs/Attraksion_nazorati_malumot_iAopoAq.docx"}]

class Answer {
  Answer({
    this.answer,
    this.responsibleDepartment,
    this.executive,
    this.files,
  });

  Answer.fromJson(dynamic json) {
    answer = json['answer'];
    responsibleDepartment = json['responsible_department'];
    executive = json['executive'];
    if (json['files'] != null) {
      files = [];
      json['files'].forEach((v) {
        files?.add(Files.fromJson(v));
      });
    }
  }

  dynamic answer;
  dynamic responsibleDepartment;
  dynamic executive;
  List<Files>? files;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['answer'] = answer;
    map['responsible_department'] = responsibleDepartment;
    map['executive'] = executive;
    if (files != null) {
      map['files'] = files?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 16
/// src : "https://att.technocorp.uz//media/docs/Attraksion_nazorati_malumot_iAopoAq.docx"

class Files {
  Files({
    this.id,
    this.src,
  });

  Files.fromJson(dynamic json) {
    id = json['id'];
    src = json['src'];
  }

  int? id;
  String? src;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['src'] = src;
    return map;
  }
}

/// label : 0
/// value : "Yangi"

class Status {
  Status({
    this.label,
    this.value,
  });

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

/// id : 15
/// image : "https://att.technocorp.uz//media/image/card_mask_1_ovaK3yK.png"

class Images {
  Images({
    this.id,
    this.image,
  });

  Images.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
  }

  int? id;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    return map;
  }
}

/// id : 15
/// src : "https://att.technocorp.uz//media/docs/uz-ru_mVnZEdn.docx"

class Docs {
  Docs({
    this.id,
    this.src,
  });

  Docs.fromJson(dynamic json) {
    id = json['id'];
    src = json['src'];
  }

  int? id;
  String? src;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['src'] = src;
    return map;
  }
}

/// value : 1
/// label : "Attraksion passporti mavjud emas"

class OffenseTypes {
  OffenseTypes({
    this.value,
    this.label,
  });

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
/// label : "Amir Temur istirohat bog'i"

class Park {
  Park({
    this.value,
    this.label,
  });

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
/// label : "Zanjirli karusel"
/// image : "https://att.technocorp.uz//media/image/%D0%A6%D0%B5%D0%BF%D0%BE%D1%87%D0%BD%D0%B0%D1%8F.jpg"

class Attraction {
  Attraction({
    this.value,
    this.label,
    this.image,
  });

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
/// label : "Oqdaryo tumani"

class District {
  District({
    this.value,
    this.label,
  });

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
    this.label,
  });

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
