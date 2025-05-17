class DashboardModel {
  final String name;
  final String doj;
  final String experience;
  final String specialty;
  final String phone;

  final List<Map<String, dynamic>> quickActions;

  DashboardModel({
    required this.name,
    required this.doj,
    required this.experience,
    required this.specialty,
    required this.phone,
    required this.quickActions,
  });
}