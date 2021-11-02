class User {
  final String email;
  final String firstName;
  final String lastName;
  final String schoolName;
  final String role;
  final String uid;
  final String image;

  User(
      {this.image,
      this.uid,
      this.email,
      this.firstName,
      this.lastName,
      this.schoolName,
      this.role});

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'schoolName': schoolName,
      'role': role,
      'uid': uid,
      'image': image
    };
  }

  static User fromMap(Map<String, dynamic> data) {
    return User(
        uid: data['uid'],
        role: data['role'],
        schoolName: data['schoolName'],
        lastName: data['lastName'],
        firstName: data['firstName'],
        email: data['email'],
        image: data['image']);
  }
}
