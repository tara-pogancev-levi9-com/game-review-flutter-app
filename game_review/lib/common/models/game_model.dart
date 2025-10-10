import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_model.freezed.dart';
part 'game_model.g.dart';

@freezed
abstract class GameModel with _$GameModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory GameModel({
    required String id,
    required String title,
    List<String>? genres,
    List<String>? platforms,
    String? description,
    String? developer,
    String? publisher,
    DateTime? releaseDate,
    String? coverImageUrl,
  }) = _GameModel;

  factory GameModel.fromJson(Map<String, dynamic> json) =>
      _$GameModelFromJson(json);
}
