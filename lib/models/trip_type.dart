class TripType {
  TripType({
    required this.id,
    required this.slug,
    required this.name,
    required this.isActive,
  });

  final int id;
  final String slug;
  final String name;
  late bool isActive;

  static List<TripType> getTripTypeServices() {
    return [
      TripType(id: 1, slug: 'one-trip', name: 'Aller simple', isActive: false),
      TripType(
          id: 2, slug: 'round-trip', name: 'Aller - retour', isActive: false),
    ];
  }
}
