import '../database.dart';

class ClientsTable extends SupabaseTable<ClientsRow> {
  @override
  String get tableName => 'clients';

  @override
  ClientsRow createRow(Map<String, dynamic> data) => ClientsRow(data);
}

class ClientsRow extends SupabaseDataRow {
  ClientsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ClientsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get stylistId => getField<String>('stylist_id')!;
  set stylistId(String value) => setField<String>('stylist_id', value);

  String? get firstName => getField<String>('first_name');
  set firstName(String? value) => setField<String>('first_name', value);

  String? get lastName => getField<String>('last_name');
  set lastName(String? value) => setField<String>('last_name', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  int? get birthMonth => getField<int>('birth_month');
  set birthMonth(int? value) => setField<int>('birth_month', value);

  int? get birthDay => getField<int>('birth_day');
  set birthDay(int? value) => setField<int>('birth_day', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get clientPhoto => getField<String>('client_photo');
  set clientPhoto(String? value) => setField<String>('client_photo', value);

  String? get contactIdentifier => getField<String>('contact_identifier');
  set contactIdentifier(String? value) =>
      setField<String>('contact_identifier', value);

  bool get archived => getField<bool>('archived')!;
  set archived(bool value) => setField<bool>('archived', value);
}
