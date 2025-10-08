class ReviewComment {
  final String id;
  final String userId;
  final String reviewId;
  final String? parentCommentId;
  final String content;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ReviewComment({
    required this.id,
    required this.userId,
    required this.reviewId,
    this.parentCommentId,
    required this.content,
    this.createdAt,
    this.updatedAt,
  });

  factory ReviewComment.fromJson(Map<String, dynamic> json) {
    return ReviewComment(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      reviewId: json['review_id'] as String,
      parentCommentId: json['parent_comment_id'] as String?,
      content: json['content'] as String,
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
      'review_id': reviewId,
      'parent_comment_id': parentCommentId,
      'content': content,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  ReviewComment copyWith({
    String? id,
    String? userId,
    String? reviewId,
    String? parentCommentId,
    String? content,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ReviewComment(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      reviewId: reviewId ?? this.reviewId,
      parentCommentId: parentCommentId ?? this.parentCommentId,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReviewComment && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'ReviewComment(id: $id, content: $content)';
  }
}
