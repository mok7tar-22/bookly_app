part of 'featured_books_cubit.dart';

abstract class FeatureBooksState extends Equatable {
  const FeatureBooksState();

  @override
  List<Object> get props => [];
}

class FeaturedBooksInitial extends FeatureBooksState {}

class FeaturedBooksLoading extends FeatureBooksState {}

class FeaturedBooksFailure extends FeatureBooksState {
  final String errMessage;

  const FeaturedBooksFailure(this.errMessage);
}

class FeaturedBooksSuccess extends FeatureBooksState {
  final List<BookModel> books;

  const FeaturedBooksSuccess(this.books);
}
