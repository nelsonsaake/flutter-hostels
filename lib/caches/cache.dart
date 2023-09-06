import 'package:hostels/caches/cache_using_shared_preferences.dart';

class Cache {
  // mobile

  static final _cachedData = CacheUsingSharedPrederences<String>("#1");

  static String get data => _cachedData.get() ?? "";

  static set data(String v) => _cachedData.set(v);
}
