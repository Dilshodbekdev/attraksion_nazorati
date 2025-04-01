/// account_count : 0
/// appeal_count : 0
/// appeal_new : 0
/// appeal_proccess : 0
/// appeal_finished : 0

class StatisticModel {
  StatisticModel({
    this.accountCount,
    this.appealCount,
    this.appealNew,
    this.appealProccess,
    this.appealFinished,
  });

  StatisticModel.fromJson(dynamic json) {
    accountCount = json['account_count'];
    appealCount = json['appeal_count'];
    appealNew = json['appeal_new'];
    appealProccess = json['appeal_proccess'];
    appealFinished = json['appeal_finished'];
  }

  int? accountCount;
  int? appealCount;
  int? appealNew;
  int? appealProccess;
  int? appealFinished;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['account_count'] = accountCount;
    map['appeal_count'] = appealCount;
    map['appeal_new'] = appealNew;
    map['appeal_proccess'] = appealProccess;
    map['appeal_finished'] = appealFinished;
    return map;
  }
}
