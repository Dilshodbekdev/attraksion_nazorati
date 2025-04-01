/// data : {"first_name":"DILSHOD","last_name":"NURULLAYEV","father_name":"INATILLO UG‘LI","phone":null,"email":"","pin":"32409986060027","pport_no":"AA8456989","birth_date":null,"per_adr":null}
/// token : {"refresh_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyNzUwOTA4NywiaWF0IjoxNzI0OTE3MDg3LCJqdGkiOiI2MTc4MmM5YjE2Zjg0ZmI5ODJmMGRiOGNlMDcxMmJkNSIsInVzZXJfaWQiOjR9.EPUDcL82PaSlUNAHEbZuOroj5n6uNtD2XJ_coeDQtto","access_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzI0OTQyMjg3LCJpYXQiOjE3MjQ5MTcwODcsImp0aSI6ImVhOGEwNWZhNTI2MTRmYmRiYjRmMzVhZTM4Y2JiZDViIiwidXNlcl9pZCI6NH0.9Z3c26m9qCsLPDMEW8EZcWm5sQhDxHlKYiyuq13U1g0"}

class OneIdModel {
  OneIdModel({
    this.data,
    this.token,
  });

  OneIdModel.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    token = json['token'] != null ? Token.fromJson(json['token']) : null;
  }

  Data? data;
  Token? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    if (token != null) {
      map['token'] = token?.toJson();
    }
    return map;
  }
}

/// refresh_token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyNzUwOTA4NywiaWF0IjoxNzI0OTE3MDg3LCJqdGkiOiI2MTc4MmM5YjE2Zjg0ZmI5ODJmMGRiOGNlMDcxMmJkNSIsInVzZXJfaWQiOjR9.EPUDcL82PaSlUNAHEbZuOroj5n6uNtD2XJ_coeDQtto"
/// access_token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzI0OTQyMjg3LCJpYXQiOjE3MjQ5MTcwODcsImp0aSI6ImVhOGEwNWZhNTI2MTRmYmRiYjRmMzVhZTM4Y2JiZDViIiwidXNlcl9pZCI6NH0.9Z3c26m9qCsLPDMEW8EZcWm5sQhDxHlKYiyuq13U1g0"

class Token {
  Token({
    this.refreshToken,
    this.accessToken,
  });

  Token.fromJson(dynamic json) {
    refreshToken = json['refresh_token'];
    accessToken = json['access_token'];
  }

  String? refreshToken;
  String? accessToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['refresh_token'] = refreshToken;
    map['access_token'] = accessToken;
    return map;
  }
}

/// first_name : "DILSHOD"
/// last_name : "NURULLAYEV"
/// father_name : "INATILLO UG‘LI"
/// phone : null
/// email : ""
/// pin : "32409986060027"
/// pport_no : "AA8456989"
/// birth_date : null
/// per_adr : null

class Data {
  Data({
    this.firstName,
    this.lastName,
    this.fatherName,
    this.phone,
    this.email,
    this.pin,
    this.pportNo,
    this.birthDate,
    this.perAdr,
  });

  Data.fromJson(dynamic json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    fatherName = json['father_name'];
    phone = json['phone'];
    email = json['email'];
    pin = json['pin'];
    pportNo = json['pport_no'];
    birthDate = json['birth_date'];
    perAdr = json['per_adr'];
  }

  String? firstName;
  String? lastName;
  String? fatherName;
  dynamic phone;
  String? email;
  String? pin;
  String? pportNo;
  dynamic birthDate;
  dynamic perAdr;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['father_name'] = fatherName;
    map['phone'] = phone;
    map['email'] = email;
    map['pin'] = pin;
    map['pport_no'] = pportNo;
    map['birth_date'] = birthDate;
    map['per_adr'] = perAdr;
    return map;
  }
}
