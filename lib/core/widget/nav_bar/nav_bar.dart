import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glaze_nav_bar/glaze_nav_bar.dart';
import 'package:supabase_app/features/authors/presentation/pages/authors_page.dart';
import 'package:supabase_app/features/books/presentation/pages/books_page.dart';
class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  final List<Widget> _pages=[
    const AuthorsPage(),
    const BooksPage(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      bottomNavigationBar: GlazeNavBar(
        //backgroundColor: Color(0xFFFF6F00),
        buttonBackgroundColor: Colors.deepPurple,
        color:Colors.deepPurple,
        items: [
          GlazeNavBarItem(child: Icon(Icons.person,color: Colors.white,), label: 'Authors',labelStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
          GlazeNavBarItem(child: Icon(Icons.menu_book,color: Colors.white,), label: 'Books',labelStyle: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
        ],
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

