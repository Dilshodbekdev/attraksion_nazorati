/// id : 2
/// options : [{"id":5,"text":"Juda samimiy va professional"},{"id":6,"text":"Do‘stona, lekin yaxshilash kerak"},{"id":7,"text":"Neytral"},{"id":8,"text":"Juda samimiy emas"}]
/// text : "Attraksionlar xodimlarining mehnatini qanday baholaysiz?"

class QuestionnaireModel {
  QuestionnaireModel({
    this.id,
    this.options,
    this.text,
  });

  QuestionnaireModel.fromJson(dynamic json) {
    id = json['id'];
    if (json['options'] != null) {
      options = [];
      json['options'].forEach((v) {
        options?.add(Options1.fromJson(v));
      });
    }
    text = json['text'];
  }

  int? id;
  List<Options1>? options;
  String? text;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (options != null) {
      map['options'] = options?.map((v) => v.toJson()).toList();
    }
    map['text'] = text;
    return map;
  }
}

/// id : 5
/// text : "Juda samimiy va professional"

class Options1 {
  Options1({
    this.id,
    this.text,
  });

  Options1.fromJson(dynamic json) {
    id = json['id'];
    text = json['text'];
  }

  int? id;
  String? text;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['text'] = text;
    return map;
  }
}
