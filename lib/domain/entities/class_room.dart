class ClassRoom {
  final int? id;
  final String name;
  final int createDateRaw;
  final int tuition;
  final String schedulerIdsRaw;
  final int isOpenRaw;
  final int index;
  final String? image;

  ClassRoom(
      {this.id,
      required this.name,
      required this.createDateRaw,
      required this.tuition,
      required this.schedulerIdsRaw,
      required this.isOpenRaw,
      this.index = -1,
      this.image});
}
