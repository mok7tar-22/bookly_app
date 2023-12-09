part of 'search_book_cubit.dart';

abstract class SearchBookState extends Equatable {
  const SearchBookState();
}

class SearchBookInitial extends SearchBookState {
  @override
  List<Object> get props => [];
}

class SearchBooksLoading extends SearchBookState {
  @override
  List<Object?> get props => [];
}

class SearchBooksFailure extends SearchBookState {
  final String errMessage;

  const SearchBooksFailure(this.errMessage);

  @override
  List<Object?> get props => [errMessage];
}

class SearchBooksSuccess extends SearchBookState {
  final List<BookModel> books;

  const SearchBooksSuccess(this.books);

  @override
  List<Object?> get props => [books];
}
