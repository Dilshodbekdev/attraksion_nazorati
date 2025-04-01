class ConfirmationBody {
  int? userId;
  String? code;

  ConfirmationBody({this.code, this.userId});

  ConfirmationBody.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['code'] = code;
    return data;
  }
}