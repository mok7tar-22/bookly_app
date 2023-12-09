import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/app_router.dart';
import '../../../../../core/widget/custom_error_widget.dart';
import '../../../../../core/widget/custom_loading_shimmer_vertical.dart';
import '../../manger/smila_books_cubit/similar_books_cubit.dart';
import 'custom_book_image.dart';

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      GoRouter.of(context).push(
                        AppRouter.kBookDetailsView,
                        extra: state.books[index],
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: CustomBookImage(
                        imageUrl:
                            state.books[index].volumeInfo.imageLinks?.thumbnail,
                      ),
                    ),
                  );
                }),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(
            errMessage: state.errMessage,
            onPressed: () {
              BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks;
            },
          );
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
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
