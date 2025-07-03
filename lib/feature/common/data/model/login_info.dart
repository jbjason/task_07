import 'dart:convert';

class LoginInfo {
  final String email;
  final String pass;
  const LoginInfo({required this.email, required this.pass});

  LoginInfo copyWith({String? email, String? pass}) {
    return LoginInfo(
      email: email ?? this.email,
      pass: pass ?? this.pass,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'email': email, 'pass': pass};
  }

  factory LoginInfo.fromMap(Map<String, dynamic> map) {
    return LoginInfo(
      email: map['email'].toString(),
      pass: map['pass'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginInfo.fromJson(dynamic source) =>
      LoginInfo.fromMap(json.decode(source) as Map<String, dynamic>);
}
