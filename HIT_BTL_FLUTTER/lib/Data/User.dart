class User {
  String fullName;
  String userName;
  String password;
  String? email;
  String? phoneNumber;
  String gender;
  String address;
  String birthday;
  int point;

  User({
    required this.fullName,
    required this.userName,
    required this.password,
    this.email,
    this.phoneNumber,
    required this.gender,
    required this.address,
    required this.birthday,
    required this.point,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'username': userName,
      'password': password,
      'email': email,
      'phoneNumber': phoneNumber,
      'gender': gender,
      'address': address,
      'birthday': birthday,
    };
  }
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fullName: json['fullName'],
      userName: json['username'],
      password: json['password'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      gender: json['gender'],
      address: json['address'],
      birthday: json['birthday'],
      point: json['point']
    );
  }
}
