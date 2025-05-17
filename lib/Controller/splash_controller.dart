import '../Model/splash_config.dart';

class SplashController {
  Future<SplashConfig> loadConfig() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate loading
    return SplashConfig(
      collegeName: "Bacha Khan College Of Dentistry",
      departmentName: "Department Of Orthodontics",
    );
  }

  Future<bool> checkFirstLaunch() async {
    // You can implement actual first launch check here
    return false;
  }
}