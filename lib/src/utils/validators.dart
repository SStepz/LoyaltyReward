String? validateEmail(String? value) {
  if (value == null || value.isEmpty) return 'Email is required.';
  final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  if (!emailRegex.hasMatch(value)) return 'Enter a valid email.';
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) return 'Password is required.';
  if (value.length != 8) return 'Password must be exactly 8 digits.';
  return null;
}
