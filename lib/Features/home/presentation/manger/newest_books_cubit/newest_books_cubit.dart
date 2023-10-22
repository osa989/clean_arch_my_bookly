import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:my_bookly/Features/home/domain/use_cases/fetch_newset_books_use_case.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewsetBooksUseCase) : super(NewestBooksInitial());
  final FetchNewsetBooksUseCase fetchNewsetBooksUseCase;
  Future<void> fetchNewsetBooks() async {
    emit(NewestBooksLoading());
    var result = await fetchNewsetBooksUseCase.call();
    result.fold((failure) {
      emit(NewestBooksFailure(failure.message));
    }, (books) {
      emit(NewsetBooksSuccess(books));
    });
  }
}
