import 'package:hive_flutter/hive_flutter.dart';

abstract class FavoritesLocalDataSource {
  Future<List<String>> getFavorites();
  Future<void> toggleFavorite(String id);
}

class FavoritesLocalDataSourceImpl implements FavoritesLocalDataSource {
  static const String boxName = 'favorites_box';
  static const String key = 'favorite_ids';

  @override
  Future<List<String>> getFavorites() async {
    final box = await Hive.openBox(boxName);
    return box.get(key, defaultValue: <String>[])!.cast<String>();
  }

  @override
  Future<void> toggleFavorite(String id) async {
    final box = await Hive.openBox(boxName);
    final currentFavorites = box
        .get(key, defaultValue: <String>[])!
        .cast<String>();

    final updatedFavorites = List<String>.from(currentFavorites);
    if (updatedFavorites.contains(id)) {
      updatedFavorites.remove(id);
    } else {
      updatedFavorites.add(id);
    }

    await box.put(key, updatedFavorites);
  }
}
