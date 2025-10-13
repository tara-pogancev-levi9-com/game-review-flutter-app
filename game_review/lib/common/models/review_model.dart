import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_model.freezed.dart';
part 'review_model.g.dart';

@freezed
abstract class ReviewModel with _$ReviewModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ReviewModel({
    required String id,
    required String user_id,
    required String game_id,
    String? title,
    String? content,
    double? overall_rating,
    double? gameplay_rating,
    double? graphics_rating,
    double? story_rating,
    double? sound_rating,
    double? value_rating,
    List<String>? pros,
    List<String>? cons,
    int? playtime_hours,
    String? completion_status,
    bool? recommended,
    DateTime? created_at,
    DateTime? updated_at,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
}

extension ReviewModelExtension on ReviewModel {
  //Converts to JSON removing NULL values for API requests
  Map<String, dynamic> toJsonForApi({bool includeNulls = false}) {
    final json = toJson();

    if (includeNulls) {
      return json;
    }

    //Remove null values and system generated fields
    json.removeWhere(
      (key, value) =>
          value == null ||
          key == 'id' ||
          key == 'created_at' ||
          key == 'updated_at',
    );

    return json;
  }
}
