import 'package:news_app/core/api/service/base/base_rest_service.dart';

abstract class NewsRemoteDataSource {}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final BaseRestService baseRestService;

  NewsRemoteDataSourceImpl({
    required this.baseRestService,
  });
}
