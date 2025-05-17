class InlinePatient {
  final String id;
  final String name;
  final String condition;

  const InlinePatient({
    required this.id,
    required this.name,
    required this.condition,
  });

  static List<InlinePatient> demoPatients() {
    return const [
      InlinePatient(id: '1', name: 'Arshad Ali', condition: 'Cingivitis'),
      InlinePatient(id: '2', name: 'Arshad Ali', condition: 'Cingivitis'),
      InlinePatient(id: '3', name: 'Arshad Ali', condition: 'Cingivitis'),
      InlinePatient(id: '4', name: 'Arshad Ali', condition: 'Cingivitis'),
      InlinePatient(id: '5', name: 'Arshad Ali', condition: 'Cingivitis'),
      InlinePatient(id: '6', name: 'Arshad Ali', condition: 'Cingivitis'),
      InlinePatient(id: '7', name: 'Arshad Ali', condition: 'Cingivitis'),
    ];
  }
}