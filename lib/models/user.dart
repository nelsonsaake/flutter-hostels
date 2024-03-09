class AppUser {
  const AppUser({
    this.id,
    this.email,
    this.name,
    this.photoURL,
    this.phoneNumber,
    bool? isAdmin,
  }) : isAdmin = isAdmin ?? false;

  final String? id;
  final String? email;
  final String? name;
  final String? phoneNumber;
  final String? photoURL;
  final bool isAdmin;

  AppUser.fromMap(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        name = json['name'],
        photoURL = json['photoURL'],
        phoneNumber = json['phoneNumber'],
        isAdmin = json['isAdmin'] ?? false;

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['name'] = name;
    data['photoURL'] = photoURL;
    data['phoneNumber'] = phoneNumber;
    data['isAdmin'] = isAdmin;
    return data;
  }
}
