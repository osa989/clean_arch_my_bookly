import 'package:dartz/dartz.dart';
import 'package:my_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:my_bookly/Features/home/domain/repos/home_repo.dart';
import 'package:my_bookly/core/errors/failure.dart';

class FetchFeaturedBooksUseCase {
  final HomeRepo homeRepo;
  FetchFeaturedBooksUseCase(this.homeRepo);

  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() {
    //check permission
    return homeRepo.fetchFeaturedBooks();
  }
}
