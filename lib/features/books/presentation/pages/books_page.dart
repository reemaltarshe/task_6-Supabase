import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_app/features/books/presentation/cubit/book_cubit.dart';
import 'package:supabase_app/features/books/presentation/widget/book_card.dart';

import '../../../authors/presentation/cubit/author_cubit.dart';
import 'add_book_page.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFEDECEC),
      appBar: AppBar(
        title: Text('Library Catalog',style: TextStyle(color: Colors.deepPurple, fontSize: 30, fontWeight: FontWeight.w500),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) =>MultiBlocProvider(
                    providers: [
                      BlocProvider.value(
                        value: context.read<BookCubit>(),
                      ),
                      BlocProvider.value(
                        value: context.read<AuthorCubit>(),
                      ),
                    ],
                  child:const AddBookPage() ,
                )

            ),
          );
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<BookCubit,BookState>(
          builder: (context,state){
            if(state is BookLoading){
              return Center(child: CircularProgressIndicator(),);
            }
            if(state is BookLoaded){
              return ListView.builder(
                   itemCount: state.books.length,
                  itemBuilder: (_,i) =>BookCard(book: state.books[i]),
              );
            }
            return SizedBox();
          }
      ),
    );
  }
}
