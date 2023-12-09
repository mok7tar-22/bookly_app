import 'package:bookly_app/features/home/presentation/views/widgets/similar_book_list_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/app_styles.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: AppStyles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const SimilarBookListView(),
      ],
    );
  }
}
