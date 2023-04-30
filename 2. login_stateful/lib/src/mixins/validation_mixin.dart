class ValidationMixin {
  String? validateEmail(String? email) {
    if (!email!.contains('@')) {
      return 'Please enter a valid email!';
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password!.length < 8) {
      return 'Please enter a valid password~';
    }
    return null;
  }
}
