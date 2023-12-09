import 'package:bookly_app/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/book/book_model.dart';
import '../manger/smila_books_cubit/similar_books_cubit.dart';

class BookDetailsView extends StatefulWidget {
  final BookModel bookModel;
  const BookDetailsView({Key? key, required this.bookModel}) : super(key: key);

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
        category:
            widget.bookModel.volumeInfo.categories?[0] ?? "Computer Science");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BookDetailsViewBody(
        bookModel: widget.bookModel,
      )),
    );
  }
}
