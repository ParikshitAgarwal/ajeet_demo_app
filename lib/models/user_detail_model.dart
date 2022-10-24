class UserDetail {
  final String name;
  final String id;
  final String atype;
  String? age;
  String? gender;
  bool isLoggedIn;
  UserDetail({
    required this.id,
    required this.atype,
    required this.name,
    this.age,
    this.gender,
    this.isLoggedIn = false,
  });
}
