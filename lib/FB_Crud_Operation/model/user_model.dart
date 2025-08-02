class UserModel {
  dynamic id;
  String phone;
  String fullname;
  dynamic password;
  dynamic email;

  UserModel(
      {required this.id,
      required this.fullname,
      required this.phone,
      required this.email,
      required this.password});
// model to map ..
  Map<String, dynamic> tomap() {
    return {
      'FullName': fullname,
      'Phone': phone,
      'Email': email,
      'Password': password,
      'Id': id,
    };
  }

// map to model
  factory UserModel.toModel(Map<String, dynamic> map) {
    return UserModel(
        fullname: map['FullName'],
        phone: map['Phone'],
        email: map['Email'],
        password: map['Password'],
        id: map['Id']);
  }
}
