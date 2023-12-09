import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/data/models/book/book_model.dart';
import '../../../data/repos/search_repo.dart';

part 'search_book_state.dart';

class SearchBookCubit extends Cubit<SearchBookState> {
  SearchBookCubit(this.searchRepo) : super(SearchBookInitial());
  final SearchRepo searchRepo;
  String? searchBookTextField;
  Future<void> fetchSearchedBooks({required String book}) async {
    emit(SearchBooksLoading());
    var result = await searchRepo.searchToBooks(book: book);
    result.fold((failure) {
      emit(SearchBooksFailure(failure.errMessage));
    }, (books) {
      emit(SearchBooksSuccess(books));
    });
  }
}
