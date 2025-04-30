class User {
  final String? firstName;
  final String? lastName;
  final String? role;
  final String? branch;
  final String? emailAddress;
  final String? mobilePhone;
  final String? profileImage;

  User({
    this.firstName,
    this.lastName,
    this.role,
    this.branch,
    this.emailAddress,
    this.mobilePhone,
    this.profileImage,
  });

  String get fullName => '$firstName $lastName';

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'],
      lastName: json['lastName'],
      role: json['role'],
      branch: json['branch'],
      emailAddress: json['emailAddress'],
      mobilePhone: json['mobilePhone'],
      profileImage: json['profileImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'role': role,
      'branch': branch,
      'emailAddress': emailAddress,
      'mobilePhone': mobilePhone,
      'profileImage': profileImage,
    };
  }

  @override
  String toString() => fullName;
}
