import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';
export 'storage/storage.dart';

const _kSupabaseUrl = 'https://sxxgifkkhbzksmwwxvxj.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InN4eGdpZmtraGJ6a3Ntd3d4dnhqIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTUzMTEwNzAsImV4cCI6MjAxMDg4NzA3MH0.G6jgSslwrDTqCI1ZE03Ur3ZZGKF00gBzvk8Q0dwpQlg';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
