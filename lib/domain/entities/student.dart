class Student {
  final int id;
  final String name;
  final List<int> classIds;
  final DateTime beginStudy;
  final DateTime lastCharge;
  final String phones;
  final bool isSpecial;
  final int? fee;
  final bool isFollow;
  final String? image;

  Student(this.id, this.name, this.classIds, this.beginStudy, this.lastCharge,
      this.phones, this.isSpecial, this.fee, this.isFollow, this.image);
}
