class GameReview {
  final String id;
  final String userId;
  final String gameId;
  final String? title;
  final String? content;
  final double? overallRating;
  final double? gameplayRating;
  final double? graphicsRating;
  final double? storyRating;
  final double? soundRating;
  final double? valueRating;
  final List<String>? pros;
  final List<String>? cons;
  final int? playtimeHours;
  final String? completionStatus;
  final bool? recommended;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const GameReview({
    required this.id,
    required this.userId,
    required this.gameId,
    this.title,
    this.content,
    this.overallRating,
    this.gameplayRating,
    this.graphicsRating,
    this.storyRating,
    this.soundRating,
    this.valueRating,
    this.pros,
    this.cons,
    this.playtimeHours,
    this.completionStatus,
    this.recommended,
    this.createdAt,
    this.updatedAt,
  });

  factory GameReview.fromJson(Map<String, dynamic> json) {
    return GameReview(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      gameId: json['game_id'] as String,
      title: json['title'] as String?,
      content: json['content'] as String?,
      overallRating: json['overall_rating'] != null
          ? (json['overall_rating'] as num).toDouble()
          : null,
      gameplayRating: json['gameplay_rating'] != null
          ? (json['gameplay_rating'] as num).toDouble()
          : null,
      graphicsRating: json['graphics_rating'] != null
          ? (json['graphics_rating'] as num).toDouble()
          : null,
      storyRating: json['story_rating'] != null
          ? (json['story_rating'] as num).toDouble()
          : null,
      soundRating: json['sound_rating'] != null
          ? (json['sound_rating'] as num).toDouble()
          : null,
      valueRating: json['value_rating'] != null
          ? (json['value_rating'] as num).toDouble()
          : null,
      pros: json['pros'] != null
          ? List<String>.from(json['pros'] as List)
          : null,
      cons: json['cons'] != null
          ? List<String>.from(json['cons'] as List)
          : null,
      playtimeHours: json['playtime_hours'] as int?,
      completionStatus: json['completion_status'] as String?,
      recommended: json['recommended'] as bool?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'game_id': gameId,
      'title': title,
      'content': content,
      'overall_rating': overallRating,
      'gameplay_rating': gameplayRating,
      'graphics_rating': graphicsRating,
      'story_rating': storyRating,
      'sound_rating': soundRating,
      'value_rating': valueRating,
      'pros': pros,
      'cons': cons,
      'playtime_hours': playtimeHours,
      'completion_status': completionStatus,
      'recommended': recommended,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  GameReview copyWith({
    String? id,
    String? userId,
    String? gameId,
    String? title,
    String? content,
    double? overallRating,
    double? gameplayRating,
    double? graphicsRating,
    double? storyRating,
    double? soundRating,
    double? valueRating,
    List<String>? pros,
    List<String>? cons,
    int? playtimeHours,
    String? completionStatus,
    bool? recommended,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return GameReview(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      gameId: gameId ?? this.gameId,
      title: title ?? this.title,
      content: content ?? this.content,
      overallRating: overallRating ?? this.overallRating,
      gameplayRating: gameplayRating ?? this.gameplayRating,
      graphicsRating: graphicsRating ?? this.graphicsRating,
      storyRating: storyRating ?? this.storyRating,
      soundRating: soundRating ?? this.soundRating,
      valueRating: valueRating ?? this.valueRating,
      pros: pros ?? this.pros,
      cons: cons ?? this.cons,
      playtimeHours: playtimeHours ?? this.playtimeHours,
      completionStatus: completionStatus ?? this.completionStatus,
      recommended: recommended ?? this.recommended,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GameReview && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'GameReview(id: $id, title: $title, overallRating: $overallRating)';
  }
}
