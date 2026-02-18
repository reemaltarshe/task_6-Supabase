// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_app/core/dependency_injectable/injection.dart'
    as _i1040;
import 'package:supabase_app/features/auth/data/datasource/user_remot_data_source.dart'
    as _i489;
import 'package:supabase_app/features/auth/data/repo_imp/user_repo_imp.dart'
    as _i960;
import 'package:supabase_app/features/auth/domain/repo/user_repo.dart' as _i704;
import 'package:supabase_app/features/auth/domain/usecase/log_out_use_case.dart'
    as _i526;
import 'package:supabase_app/features/auth/domain/usecase/sign_in_use_case.dart'
    as _i442;
import 'package:supabase_app/features/auth/domain/usecase/sign_up_use_case.dart'
    as _i34;
import 'package:supabase_app/features/auth/presentation/cubit/auth_cubit.dart'
    as _i312;
import 'package:supabase_app/features/authors/data/data_sources/author_remote_data_source.dart'
    as _i767;
import 'package:supabase_app/features/authors/data/repo_impl/author_repo_impl.dart'
    as _i772;
import 'package:supabase_app/features/authors/domain/repo/author_repo.dart'
    as _i1058;
import 'package:supabase_app/features/authors/domain/usecase/add_author_usecase.dart'
    as _i1064;
import 'package:supabase_app/features/authors/domain/usecase/get_authors_usecase.dart'
    as _i309;
import 'package:supabase_app/features/authors/presentation/cubit/author_cubit.dart'
    as _i43;
import 'package:supabase_app/features/books/data/datasource/book_remote_data_source.dart'
    as _i289;
import 'package:supabase_app/features/books/data/repo_impl/book_repo_impl.dart'
    as _i312;
import 'package:supabase_app/features/books/domain/repo/book_repo.dart'
    as _i325;
import 'package:supabase_app/features/books/domain/usecase/add_books_usecase.dart'
    as _i999;
import 'package:supabase_app/features/books/domain/usecase/get_books_usecase.dart'
    as _i793;
import 'package:supabase_app/features/books/presentation/cubit/book_cubit.dart'
    as _i54;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i454.SupabaseClient>(() => registerModule.supabaseClient);
    gh.factory<_i489.UserRemotDataSource>(
      () =>
          _i489.UserRemotDataSource(supabaseClient: gh<_i454.SupabaseClient>()),
    );
    gh.factory<_i289.BookRemoteDataSource>(
      () => _i289.BookRemoteDataSource(
        supabaseClient: gh<_i454.SupabaseClient>(),
      ),
    );
    gh.factory<_i767.AuthorRemoteDataSource>(
      () => _i767.AuthorRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i704.UserRepo>(
      () => _i960.UserRepoImp(remote: gh<_i489.UserRemotDataSource>()),
    );
    gh.factory<_i526.LogOutUseCase>(
      () => _i526.LogOutUseCase(repository: gh<_i704.UserRepo>()),
    );
    gh.factory<_i442.SignInUseCase>(
      () => _i442.SignInUseCase(repository: gh<_i704.UserRepo>()),
    );
    gh.factory<_i34.SignUpUseCase>(
      () => _i34.SignUpUseCase(repository: gh<_i704.UserRepo>()),
    );
    gh.factory<_i312.AuthCubit>(
      () => _i312.AuthCubit(
        gh<_i34.SignUpUseCase>(),
        signInUseCase: gh<_i442.SignInUseCase>(),
        logOutUseCase: gh<_i526.LogOutUseCase>(),
      ),
    );
    gh.lazySingleton<_i325.BookRepo>(
      () => _i312.BookRepoImpl(remote: gh<_i289.BookRemoteDataSource>()),
    );
    gh.lazySingleton<_i1058.AuthorRepo>(
      () => _i772.AuthorRepoImpl(remote: gh<_i767.AuthorRemoteDataSource>()),
    );
    gh.factory<_i1064.AddAuthorUsecase>(
      () => _i1064.AddAuthorUsecase(repository: gh<_i1058.AuthorRepo>()),
    );
    gh.factory<_i309.GetAuthorsUsecase>(
      () => _i309.GetAuthorsUsecase(repository: gh<_i1058.AuthorRepo>()),
    );
    gh.factory<_i999.AddBooksUsecase>(
      () => _i999.AddBooksUsecase(repository: gh<_i325.BookRepo>()),
    );
    gh.factory<_i793.GetBooksUsecase>(
      () => _i793.GetBooksUsecase(repository: gh<_i325.BookRepo>()),
    );
    gh.factory<_i43.AuthorCubit>(
      () => _i43.AuthorCubit(
        gh<_i309.GetAuthorsUsecase>(),
        gh<_i1064.AddAuthorUsecase>(),
      ),
    );
    gh.factory<_i54.BookCubit>(
      () => _i54.BookCubit(
        gh<_i999.AddBooksUsecase>(),
        gh<_i793.GetBooksUsecase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i1040.RegisterModule {}
