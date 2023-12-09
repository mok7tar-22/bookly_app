import 'package:flutter/material.dart';

import 'custom_app_bar.dart';
import 'featured_list_view.dart';
import 'newestBookListView.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                SizedBox(
                  height: 12,
                ),
                FeaturedListView(),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Best Books",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: NewestBookListView(),
        ),
      ],
    );
  }
}
