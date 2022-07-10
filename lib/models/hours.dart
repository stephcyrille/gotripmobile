class Hour {
  Hour({
    required this.id,
    required this.isActive,
    required this.value,
  });

  final int id;
  late bool isActive;
  final String value;

  static List<Hour> getHourServices() {
    return [
      for (int i = 6; i < 25; i++)
        Hour(id: i, isActive: false, value: '$i : 00'),
    ];
  }
}
