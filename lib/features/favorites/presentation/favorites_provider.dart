import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kick_store_app/core/usecases/usecase.dart';
import 'package:kick_store_app/features/favorites/data/datasources/favorites_local_data_source.dart';
import 'package:kick_store_app/features/favorites/data/repositories/favorites_repository_impl.dart';
import 'package:kick_store_app/features/favorites/domain/repositories/favorites_repository.dart';
import 'package:kick_store_app/features/favorites/domain/usecases/get_favorites.dart';
import 'package:kick_store_app/features/favorites/domain/usecases/toggle_favorite.dart';

final favoritesLocalDataSourceProvider = Provider<FavoritesLocalDataSource>((
  ref,
) {
  return FavoritesLocalDataSourceImpl();
});

final favoritesRepositoryProvider = Provider<FavoritesRepository>((ref) {
  final localDataSource = ref.watch(favoritesLocalDataSourceProvider);
  return FavoritesRepositoryImpl(localDataSource);
});

final getFavoritesUseCaseProvider = Provider<GetFavorites>((ref) {
  final repository = ref.watch(favoritesRepositoryProvider);
  return GetFavorites(repository);
});

final toggleFavoriteUseCaseProvider = Provider<ToggleFavorite>((ref) {
  final repository = ref.watch(favoritesRepositoryProvider);
  return ToggleFavorite(repository);
});

class FavoritesNotifier extends StateNotifier<List<String>> {
  final GetFavorites getFavoritesUseCase;
  final ToggleFavorite toggleFavoriteUseCase;

  FavoritesNotifier({
    required this.getFavoritesUseCase,
    required this.toggleFavoriteUseCase,
  }) : super([]) {
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    state = await getFavoritesUseCase(const NoParams());
  }

  Future<void> toggleFavorite(String id) async {
    await toggleFavoriteUseCase(id);
    await _loadFavorites();
  }

  bool isFavorite(String id) => state.contains(id);
}

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, List<String>>((ref) {
      final getFavorites = ref.watch(getFavoritesUseCaseProvider);
      final toggleFavorite = ref.watch(toggleFavoriteUseCaseProvider);
      return FavoritesNotifier(
        getFavoritesUseCase: getFavorites,
        toggleFavoriteUseCase: toggleFavorite,
      );
    });
