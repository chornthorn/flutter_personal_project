class User {
  int id;
  String firstName;
  String lastName;
  String bio;
  String email;
  String profilePicture;
  String createdAt;
  String updatedAt;

  User(
      {this.id,
        this.firstName,
        this.lastName,
        this.bio,
        this.email,
        this.profilePicture,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    bio = json['bio'];
    email = json['email'];
    profilePicture = json['profilePicture'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['bio'] = this.bio;
    data['email'] = this.email;
    data['profilePicture'] = this.profilePicture;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}