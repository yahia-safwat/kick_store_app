import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesNotifier extends StateNotifier<List<String>> {
  FavoritesNotifier() : super([]) {
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getStringList('favorites') ?? [];
  }

  Future<void> toggleFavorite(String id) async {
    final prefs = await SharedPreferences.getInstance();
    if (state.contains(id)) {
      state = state.where((favId) => favId != id).toList();
    } else {
      state = [...state, id];
    }
    await prefs.setStringList('favorites', state);
  }

  bool isFavorite(String id) => state.contains(id);
}

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, List<String>>((ref) {
      return FavoritesNotifier();
    });
