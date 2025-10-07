import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_model.freezed.dart';
part 'game_model.g.dart';

@freezed
abstract class GameModel with _$GameModel {
  const factory GameModel({
    required String id,
    required String title,
    List<String>? genres,
    String? platforms,
    String? description,
    String? developer,
    String? publisher,
    @JsonKey(name: 'release_date') DateTime? releaseDate,
    @JsonKey(name: 'cover_image_url') String? coverImageUrl,
  }) = _GameModel;

  factory GameModel.fromJson(Map<String, dynamic> json) =>
      _$GameModelFromJson(json);
}
