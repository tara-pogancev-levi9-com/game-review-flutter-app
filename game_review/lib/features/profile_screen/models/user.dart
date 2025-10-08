class User {
  final String id;
  final String email;
  final String username;
  final String? bio;
  final String? displayName;

  User({
    required this.id,
    required this.email,
    required this.username,
    required this.bio,
    required this.displayName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      bio: json['bio'] as String?,
      displayName: json['display_name'] as String?,
    );
  }
}