import 'package:my_bookly/Features/home/domain/entities/book_entity.dart';

abstract class HomeLoclaDataSource {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewsetBooks();
}

class HomeLocalDataSourceImpl extends HomeLoclaDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchNewsetBooks() {
    // TODO: implement fetchNewsetBooks
    throw UnimplementedError();
  }
}
