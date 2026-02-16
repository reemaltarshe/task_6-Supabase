import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardAuthor extends StatelessWidget {
  final String name;
  final  int booksCount;
  final VoidCallback? onTap;

  const CardAuthor({super.key,
    required this.name,
    required this.booksCount,
    this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
                    const SizedBox(height: 4),
                    Text('$booksCount books',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey.shade600,
                    ),
                    ),


                  ],
                )
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
