/// oz : "12. Mahkumlarni avf etilish tartibi qanday ?"
/// uz : "12. Маҳкумларни авф этилиш тартиби қандай ?"
/// ru : ""
/// en : ""

class LanguageModel {
  LanguageModel({
    this.oz,
    this.uz,
    this.ru,
    this.en,
  });

  LanguageModel.fromJson(dynamic json) {
    oz = json['oz'] as String;
    uz = json['uz'] as String;
    ru = json['ru'] as String;
    en = json['en'] as String;
  }

  String? oz;
  String? uz;
  String? ru;
  String? en;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['oz'] = oz;
    map['uz'] = uz;
    map['ru'] = ru;
    map['en'] = en;
    return map;
  }
}
