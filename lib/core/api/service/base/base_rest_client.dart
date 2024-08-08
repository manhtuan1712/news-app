import 'package:dio/dio.dart';
import 'package:news_app/features/home/data/models/request/request_top_headlines_model.dart';
import 'package:news_app/features/home/data/models/response/response_sources_model.dart';
import 'package:news_app/features/home/data/models/response/response_top_headlines_model.dart';
import 'package:retrofit/retrofit.dart';

part 'base_rest_client.g.dart';

@RestApi()
abstract class BaseRestClient {
  factory BaseRestClient(Dio dio, {String baseUrl}) = _BaseRestClient;

  @GET('top-headlines')
  Future<ResponseTopHeadlinesModel> getTopHeadlines(
    @Queries() RequestTopHeadlinesModel request,
  );

  @GET('top-headlines/sources')
  Future<ResponseSourcesModel> getSources();
}
