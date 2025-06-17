class User {
  final String? id;
  final String? avatar;
  final String? name;
  final String? email;

  User({this.id, this.avatar, this.name, this.email});

  User copyWith({String? id, String? avatar, String? name, String? email}) {
    return User(
      id: id ?? this.id,
      avatar: avatar ?? this.avatar,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['userId'],
      avatar: json['profilePic'],
      name: json['displayName'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.id;
    data['profilePic'] = this.avatar;
    data['displayName'] = this.name;
    data['email'] = this.email;
    return data;
  }
}
