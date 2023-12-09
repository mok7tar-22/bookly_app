import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_styles.dart';
import '../../../../core/widget/book_item.dart';
import '../../../../core/widget/custom_error_widget.dart';
import '../../../../core/widget/custom_loading_shimmer_vertical.dart';
import '../manger/search_book_cubit/search_book_cubit.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBookCubit, SearchBookState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return ListView.builder(
            itemCount: state.books.length,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: BookItem(bookModel: state.books[index]));
            },
          );
        } else if (state is SearchBooksFailure) {
          return CustomErrorWidget(
            errMessage: state.errMessage,
            onPressed: () {
              BlocProvider.of<SearchBookCubit>(context).fetchSearchedBooks(
                  book: BlocProvider.of<SearchBookCubit>(context)
                          .searchBookTextField ??
                      "");
            },
          );
        } else if (state is SearchBooksLoading) {
          return const CustomLoadingShimmer(
              width: double.infinity, height: 125);
        } else {
          return const Center(
            child: Text("Search to Books", style: AppStyles.textStyle18),
          );
        }
      },
    );
  }
}
