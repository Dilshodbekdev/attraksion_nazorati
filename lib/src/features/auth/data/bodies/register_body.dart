class RegisterBody {
  RegisterBody({
      this.fullName, 
      this.login, 
      this.phoneNumber, 
      this.email, 
      this.password,});

  RegisterBody.fromJson(dynamic json) {
    fullName = json['full_name'];
    login = json['login'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    password = json['password'];
  }
  String? fullName;
  String? login;
  String? phoneNumber;
  String? email;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['full_name'] = fullName;
    map['login'] = login;
    map['phone_number'] = phoneNumber;
    map['email'] = email;
    map['password'] = password;
    return map;
  }

}