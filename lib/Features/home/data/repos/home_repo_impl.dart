import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_bookly/Features/home/data/data_sources/home_local_data_dource.dart';
import 'package:my_bookly/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:my_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:my_bookly/Features/home/domain/repos/home_repo.dart';
import 'package:my_bookly/core/errors/failure.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLoclaDataSource homeLoclaDataSource;

  HomeRepoImpl(
      {required this.homeRemoteDataSource, required this.homeLoclaDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({int pageNumber =0}) async {
      List<BookEntity> booksList; 
    try {
      booksList = homeLoclaDataSource.fetchFeaturedBooks();
      if (booksList.isNotEmpty) {
        return right(booksList);
      }
       booksList= await homeRemoteDataSource.fetchFeaturedBooks();
      return right(booksList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
        }
        else{
          return left(ServerFailure(e.toString()));
        }
      }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewsetBooks() async{
       try {
      List<BookEntity> books = homeLoclaDataSource.fetchNewsetBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchNewsetBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
        }
        else{
          return left(ServerFailure(e.toString()));
        }
      }
    }
  }

