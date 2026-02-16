import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:supabase_app/features/authors/domain/entity/author_entity.dart';

import '../../domain/usecase/add_author_usecase.dart';
import '../../domain/usecase/get_authors_usecase.dart';

part 'author_state.dart';
@injectable
class AuthorCubit extends Cubit<AuthorState> {
  final GetAuthorsUsecase _getAuthorsUsecase;
  final AddAuthorUsecase _addAuthorUsecase;
  AuthorCubit(this._getAuthorsUsecase, this._addAuthorUsecase) : super(AuthorInitial());

Future<void> fetchauthor() async{
  emit(AuthorLoading());
  try{
    final authors=await _getAuthorsUsecase();
    emit(AuthorLoaded(authors: authors));
  }catch(e){
    emit(AuthorError(message: e.toString()));
  }
}

Future<void> createAuthor(String name) async{
 try{
  await _addAuthorUsecase(name);
  fetchauthor();
}catch(e){
   emit(AuthorError(message: e.toString()));
 }

}


}
