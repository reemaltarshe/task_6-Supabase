class BookEntity {
  final String id;
  final String title;
  final int? publishedYear;
  final String? authorName;
  final String? authorId;

  BookEntity({
    required this.id,
    required this.title,
    required this.publishedYear,
    required this.authorName,
    required this.authorId});
}