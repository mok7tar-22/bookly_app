import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widget/book_item.dart';
import '../../../../../core/widget/custom_error_widget.dart';
import '../../../../../core/widget/custom_loading_shimmer_vertical.dart';
import '../../manger/newest_books_cubit/newset_books_cubit.dart';

class NewestBookListView extends StatelessWidget {
  const NewestBookListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
      builder: (context, state) {
        if (state is NewsetBooksSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.books.length,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: BookItem(bookModel: state.books[index]));
            },
          );
        } else if (state is NewsetBooksFailure) {
          return CustomErrorWidget(
            errMessage: state.errMessage,
            onPressed: () {
              BlocProvider.of<NewsetBooksCubit>(context).fetchNewestBooks();
            },
          );
        } else {
          return const CustomLoadingShimmer(
              width: double.infinity, height: 120);
        }
      },
    );
  }
}
