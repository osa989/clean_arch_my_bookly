import 'package:my_bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:my_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:my_bookly/core/utils/api_service.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewsetBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;
  HomeRemoteDataSourceImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=programming');
    List<BookEntity> books = getBooksList(data);
    return books;
<<<<<<< HEAD
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
       List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
=======
>>>>>>> 0ef93c1f6ee23acfb7a65ce42c1697b7388e7e17
  }


  @override
  Future<List<BookEntity>> fetchNewsetBooks() async{
    var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=programming');
    List<BookEntity> books = getBooksList(data);
    return books;
  }
<<<<<<< HEAD
=======




  List<BookEntity> getBooksList(Map<String, dynamic> data) {
       List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
>>>>>>> 0ef93c1f6ee23acfb7a65ce42c1697b7388e7e17
}
