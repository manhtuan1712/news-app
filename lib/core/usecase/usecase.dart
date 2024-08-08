import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/core/api/error/failures.dart';
import 'package:news_app/features/home/data/models/request/request_top_headlines_model.dart';
import 'package:news_app/features/home/data/models/response/article_model.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpParams extends Equatable {
  final String email;

  final String password;

  final String confirmPassword;

  const SignUpParams({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object> get props => [email, password, confirmPassword];
}

class LoginParams extends Equatable {
  final String email;

  final String password;

  const LoginParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class RequestTopHeadlinesParams extends Equatable {
  final RequestTopHeadlinesModel requests;

  const RequestTopHeadlinesParams({
    required this.requests,
  });

  @override
  List<Object> get props => [requests];
}

class RequestTopHeadlinesLocalParams extends Equatable {
  final List<ArticleModel> articles;

  const RequestTopHeadlinesLocalParams({
    required this.articles,
  });

  @override
  List<Object> get props => [articles];
}
