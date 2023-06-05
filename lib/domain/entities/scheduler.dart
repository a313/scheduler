class Scheduler {
  final int id;
  final String name;
  final DateTime createDate;
  final DateTime beginDate;
  final DateTime? endDate;
  final bool isActive;
  final int index;

  Scheduler(this.id, this.name, this.createDate, this.beginDate, this.endDate,
      this.isActive, this.index);
}
