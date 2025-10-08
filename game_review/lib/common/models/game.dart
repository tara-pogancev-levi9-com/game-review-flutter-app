class Game {
  final String id;
  final String title;
  final List<String>? genres;
  final List<String>? platforms;
  final String? description;
  final String? developer;
  final String? publisher;
  final DateTime? releaseDate;
  final String? coverImageUrl;

  const Game({
    required this.id,
    required this.title,
    this.genres,
    this.platforms,
    this.description,
    this.developer,
    this.publisher,
    this.releaseDate,
    this.coverImageUrl,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'] as String,
      title: json['title'] as String,
      genres: json['genres'] != null
          ? List<String>.from(json['genres'] as List)
          : null,
      platforms: json['platforms'] != null
          ? List<String>.from(json['platforms'] as List)
          : null,
      description: json['description'] as String?,
      developer: json['developer'] as String?,
      publisher: json['publisher'] as String?,
      releaseDate: json['release_date'] != null
          ? DateTime.parse(json['release_date'] as String)
          : null,
      coverImageUrl: json['cover_image_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'genres': genres,
      'platforms': platforms,
      'description': description,
      'developer': developer,
      'publisher': publisher,
      'release_date': releaseDate?.toIso8601String(),
      'cover_image_url': coverImageUrl,
    };
  }

  Game copyWith({
    String? id,
    String? title,
    List<String>? genres,
    List<String>? platforms,
    String? description,
    String? developer,
    String? publisher,
    DateTime? releaseDate,
    String? coverImageUrl,
  }) {
    return Game(
      id: id ?? this.id,
      title: title ?? this.title,
      genres: genres ?? this.genres,
      platforms: platforms ?? this.platforms,
      description: description ?? this.description,
      developer: developer ?? this.developer,
      publisher: publisher ?? this.publisher,
      releaseDate: releaseDate ?? this.releaseDate,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Game && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Game(id: $id, title: $title, developer: $developer, publisher: $publisher)';
  }
}
