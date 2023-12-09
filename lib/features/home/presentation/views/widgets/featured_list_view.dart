import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/app_router.dart';
import '../../../../../core/widget/custom_error_widget.dart';
import '../../../../../core/widget/custom_loading_shimmer_vertical.dart';
import '../../manger/featured_books_cubit/featured_books_cubit.dart';
import 'custom_book_image.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureBooksCubit, FeatureBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.24,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(
                      AppRouter.kBookDetailsView,
                      extra: state.books[index],
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: CustomBookImage(
                      imageUrl:
                          state.books[index].volumeInfo?.imageLinks?.thumbnail,
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(
            errMessage: state.errMessage,
            onPressed: () {
              BlocProvider.of<FeatureBooksCubit>(context).fetchFeatureBooks();
            },
          );
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.24,
            child: const CustomLoadingShimmer(
                scrollDirection: Axis.horizontal,
                width: 125,
                height: double.infinity),
          );
        }
      },
    );
  }
}
