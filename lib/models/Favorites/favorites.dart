import 'package:ciying/api/favorites/favorites.dart';
import 'package:ciying/api/signIn/signUp.dart';
import 'package:ciying/grpc/proto/favorite.pb.dart';

class FavoritesModels {
  Future<FavoriteActionResponse> favoriteAction(
      FavoriteActionRequest data) async {
    return await Favorites.favoriteActionAPIRequest(data);
  }
}
