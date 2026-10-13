class ApiConstants {
  static const String baseUrl = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'https://yspmfjydudlgcrddnufm.supabase.co',
  );
  // static const String apiKey = String.fromEnvironment('SUPABASE_KEY');
  static const String apiKey = 'sb_publishable_pFPOXcat4AV2-mxzG4z8Ng_PNt97edn';

  static const String collections = '/rest/v1/collections';
  static const String books = '/rest/v1/books';
  static const String chapters = '/rest/v1/chapters';
  static const String hadiths = '/rest/v1/hadiths';
}
