class LoginBody {
  String? phone;
  String? password;

  LoginBody({this.phone, this.password});

  LoginBody.fromJson(Map<String, dynamic> json) {
    phone = json['phone_number'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone_number'] = phone;
    data['password'] = password;
    return data;
  }
}