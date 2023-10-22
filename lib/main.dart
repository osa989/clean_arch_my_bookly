import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_bookly/Features/home/data/data_sources/home_local_data_dource.dart';
import 'package:my_bookly/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:my_bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:my_bookly/Features/home/domain/entities/book_entity.dart';
import 'package:my_bookly/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:my_bookly/Features/home/domain/use_cases/fetch_newset_books_use_case.dart';
import 'package:my_bookly/Features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:my_bookly/Features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:my_bookly/constants.dart';
import 'package:my_bookly/core/utils/api_service.dart';
import 'package:my_bookly/core/utils/app_router.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FeaturedBooksCubit(
              FetchFeaturedBooksUseCase(
                HomeRepoImpl(
                    homeLoclaDataSource: HomeLocalDataSourceImpl(),
                    homeRemoteDataSource:
                        HomeRemoteDataSourceImpl(ApiService(Dio(),),),),
              ),
            );
          },
        ),
        BlocProvider(
          create: (context) {
            return NewestBooksCubit(
              FetchNewsetBooksUseCase(
                HomeRepoImpl(
                    homeLoclaDataSource: HomeLocalDataSourceImpl(),
                    homeRemoteDataSource:
                        HomeRemoteDataSourceImpl(ApiService(Dio(),),),),
              ),
            );
          },
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
