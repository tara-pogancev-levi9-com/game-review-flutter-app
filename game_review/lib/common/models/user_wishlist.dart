class UserWishlist {
  final String id;
  final String userId;
  final String gameId;
  final int? priority;
  final DateTime? addedAt;

  const UserWishlist({
    required this.id,
    required this.userId,
    required this.gameId,
    this.priority,
    this.addedAt,
  });

  factory UserWishlist.fromJson(Map<String, dynamic> json) {
    return UserWishlist(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      gameId: json['game_id'] as String,
      priority: json['priority'] as int?,
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
      'priority': priority,
      'added_at': addedAt?.toIso8601String(),
    };
  }

  UserWishlist copyWith({
    String? id,
    String? userId,
    String? gameId,
    int? priority,
    DateTime? addedAt,
  }) {
    return UserWishlist(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      gameId: gameId ?? this.gameId,
      priority: priority ?? this.priority,
      addedAt: addedAt ?? this.addedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserWishlist && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'UserWishlist(id: $id, gameId: $gameId, priority: $priority)';
  }
}
