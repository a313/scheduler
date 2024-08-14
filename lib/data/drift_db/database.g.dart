// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ReminderTableTable extends ReminderTable
    with TableInfo<$ReminderTableTable, reminder_drift> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReminderTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _remindDateMeta =
      const VerificationMeta('remindDate');
  @override
  late final GeneratedColumn<DateTime> remindDate = GeneratedColumn<DateTime>(
      'remind_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createDateMeta =
      const VerificationMeta('createDate');
  @override
  late final GeneratedColumn<DateTime> createDate = GeneratedColumn<DateTime>(
      'create_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _alertMeta = const VerificationMeta('alert');
  @override
  late final GeneratedColumn<String> alert = GeneratedColumn<String>(
      'alert', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<String> time = GeneratedColumn<String>(
      'time', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _repeatMeta = const VerificationMeta('repeat');
  @override
  late final GeneratedColumn<String> repeat = GeneratedColumn<String>(
      'repeat', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _intervalMeta =
      const VerificationMeta('interval');
  @override
  late final GeneratedColumn<int> interval = GeneratedColumn<int>(
      'interval', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _softIndexMeta =
      const VerificationMeta('softIndex');
  @override
  late final GeneratedColumn<int> softIndex = GeneratedColumn<int>(
      'soft_index', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(-1));
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        remindDate,
        createDate,
        alert,
        time,
        repeat,
        interval,
        softIndex,
        image
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reminder_table';
  @override
  VerificationContext validateIntegrity(Insertable<reminder_drift> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('remind_date')) {
      context.handle(
          _remindDateMeta,
          remindDate.isAcceptableOrUnknown(
              data['remind_date']!, _remindDateMeta));
    }
    if (data.containsKey('create_date')) {
      context.handle(
          _createDateMeta,
          createDate.isAcceptableOrUnknown(
              data['create_date']!, _createDateMeta));
    }
    if (data.containsKey('alert')) {
      context.handle(
          _alertMeta, alert.isAcceptableOrUnknown(data['alert']!, _alertMeta));
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    }
    if (data.containsKey('repeat')) {
      context.handle(_repeatMeta,
          repeat.isAcceptableOrUnknown(data['repeat']!, _repeatMeta));
    }
    if (data.containsKey('interval')) {
      context.handle(_intervalMeta,
          interval.isAcceptableOrUnknown(data['interval']!, _intervalMeta));
    } else if (isInserting) {
      context.missing(_intervalMeta);
    }
    if (data.containsKey('soft_index')) {
      context.handle(_softIndexMeta,
          softIndex.isAcceptableOrUnknown(data['soft_index']!, _softIndexMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  reminder_drift map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return reminder_drift(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      remindDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}remind_date']),
      createDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}create_date']),
      alert: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}alert']),
      time: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}time']),
      repeat: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}repeat']),
      interval: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}interval'])!,
      softIndex: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}soft_index'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
    );
  }

  @override
  $ReminderTableTable createAlias(String alias) {
    return $ReminderTableTable(attachedDatabase, alias);
  }
}

class reminder_drift extends DataClass implements Insertable<reminder_drift> {
  final int id;
  final String name;
  final DateTime? remindDate;
  final DateTime? createDate;
  final String? alert;
  final String? time;
  final String? repeat;
  final int interval;
  final int softIndex;
  final String? image;
  const reminder_drift(
      {required this.id,
      required this.name,
      this.remindDate,
      this.createDate,
      this.alert,
      this.time,
      this.repeat,
      required this.interval,
      required this.softIndex,
      this.image});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || remindDate != null) {
      map['remind_date'] = Variable<DateTime>(remindDate);
    }
    if (!nullToAbsent || createDate != null) {
      map['create_date'] = Variable<DateTime>(createDate);
    }
    if (!nullToAbsent || alert != null) {
      map['alert'] = Variable<String>(alert);
    }
    if (!nullToAbsent || time != null) {
      map['time'] = Variable<String>(time);
    }
    if (!nullToAbsent || repeat != null) {
      map['repeat'] = Variable<String>(repeat);
    }
    map['interval'] = Variable<int>(interval);
    map['soft_index'] = Variable<int>(softIndex);
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    return map;
  }

  ReminderTableCompanion toCompanion(bool nullToAbsent) {
    return ReminderTableCompanion(
      id: Value(id),
      name: Value(name),
      remindDate: remindDate == null && nullToAbsent
          ? const Value.absent()
          : Value(remindDate),
      createDate: createDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createDate),
      alert:
          alert == null && nullToAbsent ? const Value.absent() : Value(alert),
      time: time == null && nullToAbsent ? const Value.absent() : Value(time),
      repeat:
          repeat == null && nullToAbsent ? const Value.absent() : Value(repeat),
      interval: Value(interval),
      softIndex: Value(softIndex),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
    );
  }

  factory reminder_drift.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return reminder_drift(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      remindDate: serializer.fromJson<DateTime?>(json['remindDate']),
      createDate: serializer.fromJson<DateTime?>(json['createDate']),
      alert: serializer.fromJson<String?>(json['alert']),
      time: serializer.fromJson<String?>(json['time']),
      repeat: serializer.fromJson<String?>(json['repeat']),
      interval: serializer.fromJson<int>(json['interval']),
      softIndex: serializer.fromJson<int>(json['softIndex']),
      image: serializer.fromJson<String?>(json['image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'remindDate': serializer.toJson<DateTime?>(remindDate),
      'createDate': serializer.toJson<DateTime?>(createDate),
      'alert': serializer.toJson<String?>(alert),
      'time': serializer.toJson<String?>(time),
      'repeat': serializer.toJson<String?>(repeat),
      'interval': serializer.toJson<int>(interval),
      'softIndex': serializer.toJson<int>(softIndex),
      'image': serializer.toJson<String?>(image),
    };
  }

  reminder_drift copyWith(
          {int? id,
          String? name,
          Value<DateTime?> remindDate = const Value.absent(),
          Value<DateTime?> createDate = const Value.absent(),
          Value<String?> alert = const Value.absent(),
          Value<String?> time = const Value.absent(),
          Value<String?> repeat = const Value.absent(),
          int? interval,
          int? softIndex,
          Value<String?> image = const Value.absent()}) =>
      reminder_drift(
        id: id ?? this.id,
        name: name ?? this.name,
        remindDate: remindDate.present ? remindDate.value : this.remindDate,
        createDate: createDate.present ? createDate.value : this.createDate,
        alert: alert.present ? alert.value : this.alert,
        time: time.present ? time.value : this.time,
        repeat: repeat.present ? repeat.value : this.repeat,
        interval: interval ?? this.interval,
        softIndex: softIndex ?? this.softIndex,
        image: image.present ? image.value : this.image,
      );
  reminder_drift copyWithCompanion(ReminderTableCompanion data) {
    return reminder_drift(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      remindDate:
          data.remindDate.present ? data.remindDate.value : this.remindDate,
      createDate:
          data.createDate.present ? data.createDate.value : this.createDate,
      alert: data.alert.present ? data.alert.value : this.alert,
      time: data.time.present ? data.time.value : this.time,
      repeat: data.repeat.present ? data.repeat.value : this.repeat,
      interval: data.interval.present ? data.interval.value : this.interval,
      softIndex: data.softIndex.present ? data.softIndex.value : this.softIndex,
      image: data.image.present ? data.image.value : this.image,
    );
  }

  @override
  String toString() {
    return (StringBuffer('reminder_drift(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('remindDate: $remindDate, ')
          ..write('createDate: $createDate, ')
          ..write('alert: $alert, ')
          ..write('time: $time, ')
          ..write('repeat: $repeat, ')
          ..write('interval: $interval, ')
          ..write('softIndex: $softIndex, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, remindDate, createDate, alert, time,
      repeat, interval, softIndex, image);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is reminder_drift &&
          other.id == this.id &&
          other.name == this.name &&
          other.remindDate == this.remindDate &&
          other.createDate == this.createDate &&
          other.alert == this.alert &&
          other.time == this.time &&
          other.repeat == this.repeat &&
          other.interval == this.interval &&
          other.softIndex == this.softIndex &&
          other.image == this.image);
}

class ReminderTableCompanion extends UpdateCompanion<reminder_drift> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime?> remindDate;
  final Value<DateTime?> createDate;
  final Value<String?> alert;
  final Value<String?> time;
  final Value<String?> repeat;
  final Value<int> interval;
  final Value<int> softIndex;
  final Value<String?> image;
  const ReminderTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.remindDate = const Value.absent(),
    this.createDate = const Value.absent(),
    this.alert = const Value.absent(),
    this.time = const Value.absent(),
    this.repeat = const Value.absent(),
    this.interval = const Value.absent(),
    this.softIndex = const Value.absent(),
    this.image = const Value.absent(),
  });
  ReminderTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.remindDate = const Value.absent(),
    this.createDate = const Value.absent(),
    this.alert = const Value.absent(),
    this.time = const Value.absent(),
    this.repeat = const Value.absent(),
    required int interval,
    this.softIndex = const Value.absent(),
    this.image = const Value.absent(),
  })  : name = Value(name),
        interval = Value(interval);
  static Insertable<reminder_drift> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? remindDate,
    Expression<DateTime>? createDate,
    Expression<String>? alert,
    Expression<String>? time,
    Expression<String>? repeat,
    Expression<int>? interval,
    Expression<int>? softIndex,
    Expression<String>? image,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (remindDate != null) 'remind_date': remindDate,
      if (createDate != null) 'create_date': createDate,
      if (alert != null) 'alert': alert,
      if (time != null) 'time': time,
      if (repeat != null) 'repeat': repeat,
      if (interval != null) 'interval': interval,
      if (softIndex != null) 'soft_index': softIndex,
      if (image != null) 'image': image,
    });
  }

  ReminderTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<DateTime?>? remindDate,
      Value<DateTime?>? createDate,
      Value<String?>? alert,
      Value<String?>? time,
      Value<String?>? repeat,
      Value<int>? interval,
      Value<int>? softIndex,
      Value<String?>? image}) {
    return ReminderTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      remindDate: remindDate ?? this.remindDate,
      createDate: createDate ?? this.createDate,
      alert: alert ?? this.alert,
      time: time ?? this.time,
      repeat: repeat ?? this.repeat,
      interval: interval ?? this.interval,
      softIndex: softIndex ?? this.softIndex,
      image: image ?? this.image,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (remindDate.present) {
      map['remind_date'] = Variable<DateTime>(remindDate.value);
    }
    if (createDate.present) {
      map['create_date'] = Variable<DateTime>(createDate.value);
    }
    if (alert.present) {
      map['alert'] = Variable<String>(alert.value);
    }
    if (time.present) {
      map['time'] = Variable<String>(time.value);
    }
    if (repeat.present) {
      map['repeat'] = Variable<String>(repeat.value);
    }
    if (interval.present) {
      map['interval'] = Variable<int>(interval.value);
    }
    if (softIndex.present) {
      map['soft_index'] = Variable<int>(softIndex.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReminderTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('remindDate: $remindDate, ')
          ..write('createDate: $createDate, ')
          ..write('alert: $alert, ')
          ..write('time: $time, ')
          ..write('repeat: $repeat, ')
          ..write('interval: $interval, ')
          ..write('softIndex: $softIndex, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }
}

class $ScheduleTableTable extends ScheduleTable
    with TableInfo<$ScheduleTableTable, schedule_drift> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScheduleTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _beginMeta = const VerificationMeta('begin');
  @override
  late final GeneratedColumn<String> begin = GeneratedColumn<String>(
      'begin', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _endMeta = const VerificationMeta('end');
  @override
  late final GeneratedColumn<String> end = GeneratedColumn<String>(
      'end', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, begin, end];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'schedule_table';
  @override
  VerificationContext validateIntegrity(Insertable<schedule_drift> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('begin')) {
      context.handle(
          _beginMeta, begin.isAcceptableOrUnknown(data['begin']!, _beginMeta));
    } else if (isInserting) {
      context.missing(_beginMeta);
    }
    if (data.containsKey('end')) {
      context.handle(
          _endMeta, end.isAcceptableOrUnknown(data['end']!, _endMeta));
    } else if (isInserting) {
      context.missing(_endMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  schedule_drift map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return schedule_drift(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      begin: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}begin'])!,
      end: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}end'])!,
    );
  }

  @override
  $ScheduleTableTable createAlias(String alias) {
    return $ScheduleTableTable(attachedDatabase, alias);
  }
}

class schedule_drift extends DataClass implements Insertable<schedule_drift> {
  final int id;
  final String name;
  final String begin;
  final String end;
  const schedule_drift(
      {required this.id,
      required this.name,
      required this.begin,
      required this.end});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['begin'] = Variable<String>(begin);
    map['end'] = Variable<String>(end);
    return map;
  }

  ScheduleTableCompanion toCompanion(bool nullToAbsent) {
    return ScheduleTableCompanion(
      id: Value(id),
      name: Value(name),
      begin: Value(begin),
      end: Value(end),
    );
  }

  factory schedule_drift.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return schedule_drift(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      begin: serializer.fromJson<String>(json['begin']),
      end: serializer.fromJson<String>(json['end']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'begin': serializer.toJson<String>(begin),
      'end': serializer.toJson<String>(end),
    };
  }

  schedule_drift copyWith(
          {int? id, String? name, String? begin, String? end}) =>
      schedule_drift(
        id: id ?? this.id,
        name: name ?? this.name,
        begin: begin ?? this.begin,
        end: end ?? this.end,
      );
  schedule_drift copyWithCompanion(ScheduleTableCompanion data) {
    return schedule_drift(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      begin: data.begin.present ? data.begin.value : this.begin,
      end: data.end.present ? data.end.value : this.end,
    );
  }

  @override
  String toString() {
    return (StringBuffer('schedule_drift(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('begin: $begin, ')
          ..write('end: $end')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, begin, end);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is schedule_drift &&
          other.id == this.id &&
          other.name == this.name &&
          other.begin == this.begin &&
          other.end == this.end);
}

class ScheduleTableCompanion extends UpdateCompanion<schedule_drift> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> begin;
  final Value<String> end;
  const ScheduleTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.begin = const Value.absent(),
    this.end = const Value.absent(),
  });
  ScheduleTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String begin,
    required String end,
  })  : name = Value(name),
        begin = Value(begin),
        end = Value(end);
  static Insertable<schedule_drift> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? begin,
    Expression<String>? end,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (begin != null) 'begin': begin,
      if (end != null) 'end': end,
    });
  }

  ScheduleTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? begin,
      Value<String>? end}) {
    return ScheduleTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      begin: begin ?? this.begin,
      end: end ?? this.end,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (begin.present) {
      map['begin'] = Variable<String>(begin.value);
    }
    if (end.present) {
      map['end'] = Variable<String>(end.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScheduleTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('begin: $begin, ')
          ..write('end: $end')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ReminderTableTable reminderTable = $ReminderTableTable(this);
  late final $ScheduleTableTable scheduleTable = $ScheduleTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [reminderTable, scheduleTable];
}

typedef $$ReminderTableTableCreateCompanionBuilder = ReminderTableCompanion
    Function({
  Value<int> id,
  required String name,
  Value<DateTime?> remindDate,
  Value<DateTime?> createDate,
  Value<String?> alert,
  Value<String?> time,
  Value<String?> repeat,
  required int interval,
  Value<int> softIndex,
  Value<String?> image,
});
typedef $$ReminderTableTableUpdateCompanionBuilder = ReminderTableCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<DateTime?> remindDate,
  Value<DateTime?> createDate,
  Value<String?> alert,
  Value<String?> time,
  Value<String?> repeat,
  Value<int> interval,
  Value<int> softIndex,
  Value<String?> image,
});

class $$ReminderTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ReminderTableTable,
    reminder_drift,
    $$ReminderTableTableFilterComposer,
    $$ReminderTableTableOrderingComposer,
    $$ReminderTableTableCreateCompanionBuilder,
    $$ReminderTableTableUpdateCompanionBuilder> {
  $$ReminderTableTableTableManager(_$AppDatabase db, $ReminderTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ReminderTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ReminderTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime?> remindDate = const Value.absent(),
            Value<DateTime?> createDate = const Value.absent(),
            Value<String?> alert = const Value.absent(),
            Value<String?> time = const Value.absent(),
            Value<String?> repeat = const Value.absent(),
            Value<int> interval = const Value.absent(),
            Value<int> softIndex = const Value.absent(),
            Value<String?> image = const Value.absent(),
          }) =>
              ReminderTableCompanion(
            id: id,
            name: name,
            remindDate: remindDate,
            createDate: createDate,
            alert: alert,
            time: time,
            repeat: repeat,
            interval: interval,
            softIndex: softIndex,
            image: image,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<DateTime?> remindDate = const Value.absent(),
            Value<DateTime?> createDate = const Value.absent(),
            Value<String?> alert = const Value.absent(),
            Value<String?> time = const Value.absent(),
            Value<String?> repeat = const Value.absent(),
            required int interval,
            Value<int> softIndex = const Value.absent(),
            Value<String?> image = const Value.absent(),
          }) =>
              ReminderTableCompanion.insert(
            id: id,
            name: name,
            remindDate: remindDate,
            createDate: createDate,
            alert: alert,
            time: time,
            repeat: repeat,
            interval: interval,
            softIndex: softIndex,
            image: image,
          ),
        ));
}

class $$ReminderTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ReminderTableTable> {
  $$ReminderTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get remindDate => $state.composableBuilder(
      column: $state.table.remindDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createDate => $state.composableBuilder(
      column: $state.table.createDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get alert => $state.composableBuilder(
      column: $state.table.alert,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get time => $state.composableBuilder(
      column: $state.table.time,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get repeat => $state.composableBuilder(
      column: $state.table.repeat,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get interval => $state.composableBuilder(
      column: $state.table.interval,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get softIndex => $state.composableBuilder(
      column: $state.table.softIndex,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ReminderTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ReminderTableTable> {
  $$ReminderTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get remindDate => $state.composableBuilder(
      column: $state.table.remindDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createDate => $state.composableBuilder(
      column: $state.table.createDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get alert => $state.composableBuilder(
      column: $state.table.alert,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get time => $state.composableBuilder(
      column: $state.table.time,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get repeat => $state.composableBuilder(
      column: $state.table.repeat,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get interval => $state.composableBuilder(
      column: $state.table.interval,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get softIndex => $state.composableBuilder(
      column: $state.table.softIndex,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$ScheduleTableTableCreateCompanionBuilder = ScheduleTableCompanion
    Function({
  Value<int> id,
  required String name,
  required String begin,
  required String end,
});
typedef $$ScheduleTableTableUpdateCompanionBuilder = ScheduleTableCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String> begin,
  Value<String> end,
});

class $$ScheduleTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ScheduleTableTable,
    schedule_drift,
    $$ScheduleTableTableFilterComposer,
    $$ScheduleTableTableOrderingComposer,
    $$ScheduleTableTableCreateCompanionBuilder,
    $$ScheduleTableTableUpdateCompanionBuilder> {
  $$ScheduleTableTableTableManager(_$AppDatabase db, $ScheduleTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ScheduleTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ScheduleTableTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> begin = const Value.absent(),
            Value<String> end = const Value.absent(),
          }) =>
              ScheduleTableCompanion(
            id: id,
            name: name,
            begin: begin,
            end: end,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String begin,
            required String end,
          }) =>
              ScheduleTableCompanion.insert(
            id: id,
            name: name,
            begin: begin,
            end: end,
          ),
        ));
}

class $$ScheduleTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ScheduleTableTable> {
  $$ScheduleTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get begin => $state.composableBuilder(
      column: $state.table.begin,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get end => $state.composableBuilder(
      column: $state.table.end,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ScheduleTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ScheduleTableTable> {
  $$ScheduleTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get begin => $state.composableBuilder(
      column: $state.table.begin,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get end => $state.composableBuilder(
      column: $state.table.end,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ReminderTableTableTableManager get reminderTable =>
      $$ReminderTableTableTableManager(_db, _db.reminderTable);
  $$ScheduleTableTableTableManager get scheduleTable =>
      $$ScheduleTableTableTableManager(_db, _db.scheduleTable);
}
