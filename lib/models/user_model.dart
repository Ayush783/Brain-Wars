class Usermodel {
  final String? username, id;

  Usermodel({this.username, this.id});

  Usermodel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        username = json['username'];
}
