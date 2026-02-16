import 'package:flutter/material.dart';
import 'package:supabase_app/features/books/domain/entity/book_entity.dart';

class BookCard extends StatelessWidget {
  final BookEntity book;
  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 14,horizontal: 14),
        padding: const EdgeInsets.all(16),
        decoration:BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            book.title,
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 9,),
          Text('${book.authorName ?? 'Unknown'} • ${book.publishedYear ?? '-'}',
            style: const TextStyle(color: Colors.grey,fontSize: 20),
          ),
        ],
      ),
    );
  }
}
