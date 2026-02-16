import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:supabase_app/features/books/domain/entity/book_entity.dart';

import '../../domain/usecase/add_books_usecase.dart';
import '../../domain/usecase/get_books_usecase.dart';

part 'book_state.dart';
@injectable
class BookCubit extends Cubit<BookState> {
  final AddBooksUsecase _addBooksUsecase;
  final GetBooksUsecase _getBooksUsecase;
  BookCubit(this._addBooksUsecase, this._getBooksUsecase) : super(BookInitial());

  Future<void>loadBooks() async{
    emit(BookLoading());
    try{
      final book= await _getBooksUsecase();
      emit(BookLoaded(books: book));
    }catch(e){
      emit(BookError(message: e.toString()));

    }
  }
  
  Future<void>addNewBook({
    required String title,
    required int publishedYear,
    required String authorId,
  }) async{
   try {
     await _addBooksUsecase(title, publishedYear, authorId);
     await loadBooks();
   }catch(e){
     emit(BookError(message: e.toString()));
   }
  }


}
