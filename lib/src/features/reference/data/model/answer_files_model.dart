/// answer_files : [{"id":"667569de9fd046000131afc2","name":"test.pdf","size":1764043}]

class AnswerFilesModel {
  AnswerFilesModel({
    this.answerFiles,
  });

  AnswerFilesModel.fromJson(dynamic json) {
    if (json['answer_files'] != null) {
      answerFiles = [];
      json['answer_files'].forEach((v) {
        answerFiles?.add(AnswerFile.fromJson(v));
      });
    }
  }

  List<AnswerFile>? answerFiles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (answerFiles != null) {
      map['answer_files'] = answerFiles?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : "667569de9fd046000131afc2"
/// name : "test.pdf"
/// size : 1764043

class AnswerFile {
  AnswerFile({
    this.id,
    this.name,
    this.size,
  });

  AnswerFile.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    size = json['size'];
  }

  String? id;
  String? name;
  int? size;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['size'] = size;
    return map;
  }
}
