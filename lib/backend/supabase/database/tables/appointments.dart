import '../database.dart';

class AppointmentsTable extends SupabaseTable<AppointmentsRow> {
  @override
  String get tableName => 'appointments';

  @override
  AppointmentsRow createRow(Map<String, dynamic> data) => AppointmentsRow(data);
}

class AppointmentsRow extends SupabaseDataRow {
  AppointmentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppointmentsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get stylistId => getField<String>('stylist_id')!;
  set stylistId(String value) => setField<String>('stylist_id', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  DateTime get date => getField<DateTime>('date')!;
  set date(DateTime value) => setField<DateTime>('date', value);

  int? get color => getField<int>('color');
  set color(int? value) => setField<int>('color', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime? get startTime => getField<DateTime>('start_time');
  set startTime(DateTime? value) => setField<DateTime>('start_time', value);

  DateTime? get endDate => getField<DateTime>('end_date');
  set endDate(DateTime? value) => setField<DateTime>('end_date', value);

  DateTime? get endTime => getField<DateTime>('end_time');
  set endTime(DateTime? value) => setField<DateTime>('end_time', value);
}
