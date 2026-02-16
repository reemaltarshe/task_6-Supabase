import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_app/core/dependency_injectable/injection.dart';
import 'package:supabase_app/features/authors/presentation/cubit/author_cubit.dart';
import 'package:supabase_app/features/authors/presentation/pages/authors_page.dart';
import 'package:supabase_app/features/books/presentation/cubit/book_cubit.dart';
import 'package:supabase_app/features/books/presentation/pages/books_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/widget/nav_bar/nav_bar.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  print(dotenv.env['SUPABASE_URL']);


  await Supabase.initialize(
      url: dotenv.env['SUPABASE_URL']!,
      anonKey:  dotenv.env['SUPABASE_ANON_KEY']!,

  );
      configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<AuthorCubit>()..fetchauthor(),
            ),
            BlocProvider(
                create: (context) => getIt<BookCubit>()..loadBooks(),
            )
          ],
        child:NavBar() ,
      )



    );
  }
}
