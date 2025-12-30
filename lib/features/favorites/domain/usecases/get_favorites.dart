import 'package:kick_store_app/core/usecases/usecase.dart';
import 'package:kick_store_app/features/favorites/domain/repositories/favorites_repository.dart';

class GetFavorites implements UseCase<List<String>, NoParams> {
  final FavoritesRepository repository;

  GetFavorites(this.repository);

  @override
  Future<List<String>> call(NoParams params) async {
    return await repository.getFavorites();
  }
}
