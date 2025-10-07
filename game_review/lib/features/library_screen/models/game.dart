import 'package:freezed_annotation/freezed_annotation.dart';

part 'game.freezed.dart';
part 'game.g.dart';

@freezed
class Game with _$Game {
  const factory Game({
    required String id,
    required String title,
    String? description,
    String? developer,
    String? publisher,
    @JsonKey(name: 'release_date') DateTime? releaseDate,
    @JsonKey(name: 'cover_image_url') String? coverImageUrl,
    List<String>? genres,
    List<String>? platforms,
  }) = _Game;

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
}