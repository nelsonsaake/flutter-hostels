class Admin {
  const Admin({
    this.id,
    this.email,
    this.userId,
  });

  final String? id;
  final String? email;
  final String? userId;

  Admin.fromMap(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        userId = json['userId'];

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['userId'] = userId;
    return data;
  }
}
