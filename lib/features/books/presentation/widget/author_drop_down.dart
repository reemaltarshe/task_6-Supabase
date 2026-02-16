import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthorDropDown extends StatelessWidget {
  final List<Map<String, String>> authors;
  final String? value;
  final Function(String?) onChanged;
  const AuthorDropDown({super.key, required this.authors, this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      hint: const Text('Select an author'),
        items: authors.map((a) => DropdownMenuItem(
             value: a['id'],
            child: Text(a['name']!),
        ),
        ).toList() ,
        onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none
        )
      ),
    );
  }
}
