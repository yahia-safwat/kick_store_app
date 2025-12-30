import 'package:kick_store_app/features/favorites/data/datasources/favorites_local_data_source.dart';
import 'package:kick_store_app/features/favorites/domain/repositories/favorites_repository.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesLocalDataSource localDataSource;

  FavoritesRepositoryImpl(this.localDataSource);

  @override
  Future<List<String>> getFavorites() async {
    return await localDataSource.getFavorites();
  }

  @override
  Future<void> toggleFavorite(String id) async {
    return await localDataSource.toggleFavorite(id);
  }
}
