class OneIdBody {
  String? code;
  String? deviceKey;

  OneIdBody({this.code, this.deviceKey});

  OneIdBody.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    deviceKey = json['device_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['device_key'] = deviceKey;
    return data;
  }
}
