import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:supabase_app/features/auth/presentation/pages/sign_in_page.dart';
import 'package:supabase_app/features/authors/presentation/cubit/author_cubit.dart';
import 'package:supabase_app/features/authors/presentation/widget/card_author.dart';

class AuthorsPage extends StatefulWidget {
  const AuthorsPage({super.key});

  @override
  State<AuthorsPage> createState() => _AuthorsPageState();
}

class _AuthorsPageState extends State<AuthorsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit,AuthState>(
      listener: (context, state) {
        if (state is AuthUnauthenticated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => BlocProvider.value(
                 value: BlocProvider.of<AuthCubit>(context),
                 child:  SignInPage(),
            )
            )
          );

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Logged out successfully')),
          );
        }
      },
      child: Scaffold(
        backgroundColor:  Color(0xFFEDECEC),
        appBar: AppBar(
          title:  Text('Authors',style: TextStyle(color: Colors.deepPurple, fontSize: 30, fontWeight: FontWeight.w500),),
        actions: [
          IconButton(
            onPressed: () async{
             await context.read<AuthCubit>().logOut();
            },
            icon: Icon(Icons.logout)
          )
        ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddAuthorDialog(context),
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ),
        body: BlocBuilder<AuthorCubit,AuthorState>(
            builder: (_,state){
              if(state is AuthorLoading){
                return Center(child: CircularProgressIndicator(),);
              }
               if(state is AuthorLoaded){
                 return ListView.builder(
                     padding: const EdgeInsets.all(16),
                     itemCount: state.authors.length,
                     itemBuilder: (_,i){
                       final author = state.authors[i];
                       return CardAuthor(
                           name: author.name,
                           booksCount: author.booksCount
                       );
                     }
                 );
               }
              return const Center(child: CircularProgressIndicator());
      }

        ),
      ),
    );
  }

  void _showAddAuthorDialog(BuildContext context) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add Author', style: TextStyle(color: Colors.deepPurple,fontSize: 25, fontWeight: FontWeight.w500),),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Author name',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<AuthorCubit>().createAuthor(controller.text);
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
