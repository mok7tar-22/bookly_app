import 'package:bookly_app/core/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../features/home/data/models/book/book_model.dart';
import '../features/home/data/models/repos/home_repo_impl.dart';
import '../features/home/presentation/manger/smila_books_cubit/similar_books_cubit.dart';
import '../features/home/presentation/views/book_details_view.dart';
import '../features/home/presentation/views/home_view.dart';
import '../features/search/data/repos/search_repo_impl.dart';
import '../features/search/presentation/manger/search_book_cubit/search_book_cubit.dart';
import '../features/search/search_view.dart';
import '../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchBookCubit(getIt.get<SearchRepoImpl>()),
          child: const SearchView(),
        ),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(
            getIt.get<HomeRepoImpl>(),
          ),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
    ],
  );
}
