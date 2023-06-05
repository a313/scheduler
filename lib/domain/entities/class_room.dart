class ClassRoom {
  final int id;
  final String name;
  final DateTime createDate;
  final int tuition;
  final List<DateTime> scheduler;
  final bool isOpen;
  final int index;
  final String? image;

  ClassRoom(this.id, this.name, this.createDate, this.tuition, this.scheduler,
      this.isOpen, this.index, this.image);
}
