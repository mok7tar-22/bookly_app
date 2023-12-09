import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../manger/search_book_cubit/search_book_cubit.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({Key? key}) : super(key: key);

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              //color: Colors.white, // Set your desired background color
            ),
            child: TextField(
              controller: _textEditingController,
              onChanged: (value) {
                BlocProvider.of<SearchBookCubit>(context)
                    .fetchSearchedBooks(book: value);
                BlocProvider.of<SearchBookCubit>(context).searchBookTextField =
                    value;
              },
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(
                  FontAwesomeIcons.searchengin,
                  color: Colors.grey,
                  size: 20,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    _textEditingController.clear();
                  },
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.grey,
                  ),
                ),
                enabledBorder: buildOutlineInputBorder(),
                focusedBorder: buildOutlineInputBorder(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(30),
    );
  }
}
