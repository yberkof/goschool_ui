class User {
  final String email;
  final String firstName;
  final String lastName;
  final String schoolName;
  final String role;
  final String uid;

  User(
      {this.uid,
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
      'uid': uid
    };
  }
}
