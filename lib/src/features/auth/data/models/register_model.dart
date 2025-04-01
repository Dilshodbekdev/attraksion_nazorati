class RegisterModel {
  RegisterModel({
    this.data,
    this.userId,
    this.code,
    this.response,
    this.responseBroker,
  });

  RegisterModel.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    userId = json['user_id'];
    code = json['code'];
    response =
        json['response'] != null ? Response.fromJson(json['response']) : null;
    responseBroker = json['response_broker'] != null
        ? ResponseBroker.fromJson(json['response_broker'])
        : null;
  }

  Data? data;
  int? userId;
  String? code;
  Response? response;
  ResponseBroker? responseBroker;

  RegisterModel copyWith({
    Data? data,
    int? userId,
    String? code,
    Response? response,
    ResponseBroker? responseBroker,
  }) =>
      RegisterModel(
        data: data ?? this.data,
        userId: userId ?? this.userId,
        code: code ?? this.code,
        response: response ?? this.response,
        responseBroker: responseBroker ?? this.responseBroker,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['user_id'] = userId;
    map['code'] = code;
    if (response != null) {
      map['response'] = response?.toJson();
    }
    if (responseBroker != null) {
      map['response_broker'] = responseBroker?.toJson();
    }
    return map;
  }
}

class ResponseBroker {
  ResponseBroker({
    this.status,
    this.ok,
    this.successful,
    this.failed,
  });

  ResponseBroker.fromJson(dynamic json) {
    status = json['status'];
    ok = json['ok'];
    successful = json['successful'];
    failed = json['failed'];
  }

  int? status;
  bool? ok;
  bool? successful;
  bool? failed;

  ResponseBroker copyWith({
    int? status,
    bool? ok,
    bool? successful,
    bool? failed,
  }) =>
      ResponseBroker(
        status: status ?? this.status,
        ok: ok ?? this.ok,
        successful: successful ?? this.successful,
        failed: failed ?? this.failed,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['ok'] = ok;
    map['successful'] = successful;
    map['failed'] = failed;
    return map;
  }
}

class Response {
  Response({
    this.cookies,
    this.transferStats,
  });

  Response.fromJson(dynamic json) {
    cookies = json['cookies'];
    transferStats = json['transferStats'];
  }

  dynamic cookies;
  dynamic transferStats;

  Response copyWith({
    dynamic cookies,
    dynamic transferStats,
  }) =>
      Response(
        cookies: cookies ?? this.cookies,
        transferStats: transferStats ?? this.transferStats,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cookies'] = cookies;
    map['transferStats'] = transferStats;
    return map;
  }
}

class Data {
  Data({
    this.fullName,
    this.phoneNumber,
    this.email,
    this.code,
    this.updatedAt,
    this.createdAt,
  });

  Data.fromJson(dynamic json) {
    fullName = json['full_name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    code = json['code'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  String? fullName;
  String? phoneNumber;
  String? email;
  String? code;
  String? updatedAt;
  String? createdAt;

  Data copyWith({
    String? fullName,
    String? phoneNumber,
    String? email,
    String? code,
    String? updatedAt,
    String? createdAt,
  }) =>
      Data(
        fullName: fullName ?? this.fullName,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        email: email ?? this.email,
        code: code ?? this.code,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['full_name'] = fullName;
    map['phone_number'] = phoneNumber;
    map['email'] = email;
    map['code'] = code;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    return map;
  }
}
