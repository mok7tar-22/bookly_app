import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';

import '../../../../../core/app_styles.dart';
import '../../../data/models/book/book_model.dart';
import 'book_actions.dart';
import 'book_rating.dart';
import 'custom_book_details_appBar.dart';
import 'custom_book_image.dart';

class BookDetailsViewBody extends StatelessWidget {
  final BookModel bookModel;

  const BookDetailsViewBody({Key? key, required this.bookModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        const CustomBookDetailsAppBar(),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.2),
            child: CustomBookImage(
              imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail,
            )),
        const SizedBox(
          height: 43,
        ),
        Text(
          bookModel.volumeInfo.title ?? "",
          style: AppStyles.textStyle30.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            bookModel.volumeInfo.authors?.toString() ?? "",
            style: AppStyles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: bookModel.volumeInfo.averageRating?.round() ?? 0,
          count: bookModel.volumeInfo.ratingsCount ?? 0,
        ),
        const SizedBox(
          height: 30,
        ),
        BookActions(
          bookModel: bookModel,
        ),
        const SizedBox(
          height: 16,
        ),
        const SimilarBooksSection(),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
