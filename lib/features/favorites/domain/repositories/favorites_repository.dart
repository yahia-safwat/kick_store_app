abstract class FavoritesRepository {
  Future<List<String>> getFavorites();
  Future<void> toggleFavorite(String id);
}
