import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_wishlist_model.freezed.dart';
part 'user_wishlist_model.g.dart';

@freezed
abstract class UserWishlistModel with _$UserWishlistModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserWishlistModel({
    required String id,
    required String userId,
    required String gameId,
    int? priority,
    DateTime? addedAt,
  }) = _UserWishlistModel;

  factory UserWishlistModel.fromJson(Map<String, dynamic> json) =>
      _$UserWishlistModelFromJson(json);
}
