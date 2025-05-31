class TMO {
  final String id;
  final String name;
  final String? photoUrl;

  const TMO({
    required this.id,
    required this.name,
    this.photoUrl,
  });

  static List<TMO> demoList() {
    return const [
      TMO(id: '1', name: 'Dr. Waqar' , photoUrl:  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAGQLqzSwT6Q8ge_i08EXX6OsBybfgPYYCiQSFZrNqvNMd1IplGWyEHldQLwgOOLhdpFmk&s"),
      TMO(id: '2', name: 'Dr. Arshad'),
      TMO(id: '3', name: 'Dr. Javeed Ali', photoUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQm-b-_2EWnGwMMVIfntMNtRAgIuXjE0vd3FbSteUUfo6wO-SkMhLwyqpnTxy_tjOw9jal7&s"),
      TMO(id: '4', name: 'Dr. Nadeem Iqbal'),
      TMO(id: '5', name: 'Dr. Bilal Bacha'),
      TMO(id: '6', name: 'Dr. Waseem Durani' , photoUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmvbl_78J0EBPjPy-Iaei9Vg4gYnvCZTrWgZ1tj2WLumJfK_UUHivScA&s"),
      TMO(id: '7', name: 'Dr. Hamid Ali'),
      TMO(id: '8', name: 'Dr. Jaffar Ali'),
      TMO(id: '9', name: 'Dr. Shahid Ali'),
      TMO(id: '10', name: 'Dr. Akhtar Khan'),
      TMO(id: '11', name: 'Dr. Arshad Ali'),
    ];
  }
}