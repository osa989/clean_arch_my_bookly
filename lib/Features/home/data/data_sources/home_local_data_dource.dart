import 'package:hive_flutter/adapters.dart';
import 'package:my_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:my_bookly/constants.dart';

abstract class HomeLoclaDataSource {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewsetBooks();
}

class HomeLocalDataSourceImpl extends HomeLoclaDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var box = Hive.box<BookEntity>(kFeaturedBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewsetBooks() {
    var box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }
}
