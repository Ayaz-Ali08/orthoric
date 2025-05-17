class AuthController {
  Future<bool> login(String email, String password) async {
    // Implement actual login logic here
    await Future.delayed(const Duration(seconds: 1)); // Simulate API call
    return true; // Return false if login fails
  }
}