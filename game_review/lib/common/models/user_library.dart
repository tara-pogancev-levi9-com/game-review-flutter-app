class UserLibrary {
  final String id;
  final String userId;
  final String gameId;
  final String? platformId;
  final int hoursPlayed;
  final double completionPercentage;
  final DateTime? lastPlayed;
  final bool isFavorite;
  final DateTime? addedAt;

  const UserLibrary({
    required this.id,
    required this.userId,
    required this.gameId,
    this.platformId,
    required this.hoursPlayed,
    required this.completionPercentage,
    this.lastPlayed,
    required this.isFavorite,
    this.addedAt,
  });

  factory UserLibrary.fromJson(Map<String, dynamic> json) {
    return UserLibrary(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      gameId: json['game_id'] as String,
      platformId: json['platform_id'] as String?,
      hoursPlayed: json['hours_played'] as int? ?? 0,
      completionPercentage: json['completion_percentage'] != null
          ? (json['completion_percentage'] as num).toDouble()
          : 0.0,
      lastPlayed: json['last_played'] != null
          ? DateTime.parse(json['last_played'] as String)
          : null,
      isFavorite: json['is_favorite'] as bool? ?? false,
      addedAt: json['added_at'] != null
          ? DateTime.parse(json['added_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'game_id': gameId,
      'platform_id': platformId,
      'hours_played': hoursPlayed,
      'completion_percentage': completionPercentage,
      'last_played': lastPlayed?.toIso8601String(),
      'is_favorite': isFavorite,
      'added_at': addedAt?.toIso8601String(),
    };
  }

  UserLibrary copyWith({
    String? id,
    String? userId,
    String? gameId,
    String? platformId,
    int? hoursPlayed,
    double? completionPercentage,
    DateTime? lastPlayed,
    bool? isFavorite,
    DateTime? addedAt,
  }) {
    return UserLibrary(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      gameId: gameId ?? this.gameId,
      platformId: platformId ?? this.platformId,
      hoursPlayed: hoursPlayed ?? this.hoursPlayed,
      completionPercentage: completionPercentage ?? this.completionPercentage,
      lastPlayed: lastPlayed ?? this.lastPlayed,
      isFavorite: isFavorite ?? this.isFavorite,
      addedAt: addedAt ?? this.addedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserLibrary && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'UserLibrary(id: $id, gameId: $gameId, hoursPlayed: $hoursPlayed)';
  }
}
