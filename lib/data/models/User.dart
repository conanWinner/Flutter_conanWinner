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
}
