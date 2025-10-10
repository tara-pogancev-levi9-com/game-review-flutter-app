import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_library_model.freezed.dart';
part 'user_library_model.g.dart';

@freezed
abstract class UserLibraryModel with _$UserLibraryModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserLibraryModel({
    required String id,
    required String userId,
    required String gameId,
    String? platformId,
    required int hoursPlayed,
    required double completionPercentage,
    DateTime? lastPlayed,
    required bool isFavorite,
    DateTime? addedAt,
  }) = _UserLibraryModel;

  factory UserLibraryModel.fromJson(Map<String, dynamic> json) =>
      _$UserLibraryModelFromJson(json);
}
