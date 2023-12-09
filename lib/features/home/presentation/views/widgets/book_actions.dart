import 'package:flutter/material.dart';

import '../../../../../core/launch_url.dart';
import '../../../data/models/book/book_model.dart';
import 'custom_button.dart';

class BookActions extends StatelessWidget {
  final BookModel bookModel;
  const BookActions({
    super.key,
    required this.bookModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
              child: CustomButton(
            text: 'Free',
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          )),
          Expanded(
              child: CustomButton(
            onPressed: () {
              launchCustomUr(context, '${bookModel.volumeInfo.previewLink}');
            },
            fontSize: 16,
            text: getText(bookModel),
            backgroundColor: const Color(0xffEF8262),
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          )),
        ],
      ),
    );
  }

  String getText(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return 'Not Available';
    } else {
      return 'Preview';
    }
  }
}
