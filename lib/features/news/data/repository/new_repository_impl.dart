import 'package:news_app/features/news/data/datasources/news_remote_data_source.dart';
import 'package:news_app/features/news/domain/repository/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource newsRemoteDataSource;

  NewsRepositoryImpl({
    required this.newsRemoteDataSource,
  });
}
