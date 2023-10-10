import '../database.dart';

class StylistsTable extends SupabaseTable<StylistsRow> {
  @override
  String get tableName => 'stylists';

  @override
  StylistsRow createRow(Map<String, dynamic> data) => StylistsRow(data);
}

class StylistsRow extends SupabaseDataRow {
  StylistsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => StylistsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get firstName => getField<String>('first_name');
  set firstName(String? value) => setField<String>('first_name', value);

  String? get lastName => getField<String>('last_name');
  set lastName(String? value) => setField<String>('last_name', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get businessName => getField<String>('business_name');
  set businessName(String? value) => setField<String>('business_name', value);

  String? get profilePic => getField<String>('profile_pic');
  set profilePic(String? value) => setField<String>('profile_pic', value);

  DateTime? get lastLogin => getField<DateTime>('last_login');
  set lastLogin(DateTime? value) => setField<DateTime>('last_login', value);

  bool get onboarded => getField<bool>('onboarded')!;
  set onboarded(bool value) => setField<bool>('onboarded', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
