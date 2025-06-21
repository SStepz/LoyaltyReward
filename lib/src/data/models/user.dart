class User {
  final String email;
  final String fullName;
  int points;

  User({
    required this.email,
    required this.fullName,
    this.points = 10000,
  });
}
