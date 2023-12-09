import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../home/data/models/book/book_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> searchToBooks(
      {required String book});
}
