// Mocks generated by Mockito 5.4.4 from annotations
// in news_app/test/unitest/repository/home/home_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i9;
import 'package:news_app/features/home/data/datasource/home_local_data_source.dart'
    as _i7;
import 'package:news_app/features/home/data/datasource/home_remote_data_source.dart'
    as _i4;
import 'package:news_app/features/home/data/models/request/request_top_headlines_model.dart'
    as _i6;
import 'package:news_app/features/home/data/models/response/article_model.dart'
    as _i8;
import 'package:news_app/features/home/data/models/response/response_sources_model.dart'
    as _i3;
import 'package:news_app/features/home/data/models/response/response_top_headlines_model.dart'
    as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeResponseTopHeadlinesModel_0 extends _i1.SmartFake
    implements _i2.ResponseTopHeadlinesModel {
  _FakeResponseTopHeadlinesModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponseSourcesModel_1 extends _i1.SmartFake
    implements _i3.ResponseSourcesModel {
  _FakeResponseSourcesModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [HomeRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomeRemoteDataSource extends _i1.Mock
    implements _i4.HomeRemoteDataSource {
  @override
  _i5.Future<_i2.ResponseTopHeadlinesModel> getTopHeadlines(
          _i6.RequestTopHeadlinesModel? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopHeadlines,
          [request],
        ),
        returnValue: _i5.Future<_i2.ResponseTopHeadlinesModel>.value(
            _FakeResponseTopHeadlinesModel_0(
          this,
          Invocation.method(
            #getTopHeadlines,
            [request],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i2.ResponseTopHeadlinesModel>.value(
                _FakeResponseTopHeadlinesModel_0(
          this,
          Invocation.method(
            #getTopHeadlines,
            [request],
          ),
        )),
      ) as _i5.Future<_i2.ResponseTopHeadlinesModel>);

  @override
  _i5.Future<_i3.ResponseSourcesModel> getSources() => (super.noSuchMethod(
        Invocation.method(
          #getSources,
          [],
        ),
        returnValue: _i5.Future<_i3.ResponseSourcesModel>.value(
            _FakeResponseSourcesModel_1(
          this,
          Invocation.method(
            #getSources,
            [],
          ),
        )),
        returnValueForMissingStub: _i5.Future<_i3.ResponseSourcesModel>.value(
            _FakeResponseSourcesModel_1(
          this,
          Invocation.method(
            #getSources,
            [],
          ),
        )),
      ) as _i5.Future<_i3.ResponseSourcesModel>);
}

/// A class which mocks [HomeLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockHomeLocalDataSource extends _i1.Mock
    implements _i7.HomeLocalDataSource {
  @override
  _i5.Future<String> saveTopHeadlinesLocal(List<_i8.ArticleModel>? articles) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveTopHeadlinesLocal,
          [articles],
        ),
        returnValue: _i5.Future<String>.value(_i9.dummyValue<String>(
          this,
          Invocation.method(
            #saveTopHeadlinesLocal,
            [articles],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<String>.value(_i9.dummyValue<String>(
          this,
          Invocation.method(
            #saveTopHeadlinesLocal,
            [articles],
          ),
        )),
      ) as _i5.Future<String>);

  @override
  _i5.Future<List<_i8.ArticleModel>> getTopHeadlinesLocal() =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopHeadlinesLocal,
          [],
        ),
        returnValue:
            _i5.Future<List<_i8.ArticleModel>>.value(<_i8.ArticleModel>[]),
        returnValueForMissingStub:
            _i5.Future<List<_i8.ArticleModel>>.value(<_i8.ArticleModel>[]),
      ) as _i5.Future<List<_i8.ArticleModel>>);
}
