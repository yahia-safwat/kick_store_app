import 'package:kick_store_app/core/usecases/usecase.dart';
import 'package:kick_store_app/features/favorites/domain/repositories/favorites_repository.dart';

class ToggleFavorite implements UseCase<void, String> {
  final FavoritesRepository repository;

  ToggleFavorite(this.repository);

  @override
  Future<void> call(String params) async {
    return await repository.toggleFavorite(params);
  }
}
