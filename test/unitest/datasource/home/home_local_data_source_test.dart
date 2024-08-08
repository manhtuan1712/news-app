import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/features/home/data/datasource/home_local_data_source.dart';
import 'package:news_app/features/home/data/models/response/article_model.dart';

import 'home_local_data_source_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<HomeLocalDataSource>(
      as: #MockHomeLocalDataSource,
    ),
  ],
)
void main() {
  late MockHomeLocalDataSource mockHomeLocalDataSource;

  final List<ArticleModel> articles = <ArticleModel>[
    ArticleModel(
      author: 'The New York Times',
      title:
          'Bangladesh to Swear In Interim Government, After Days of Chaos - The New York Times',
      description: null,
      url:
          'https://news.google.com/rss/articles/CBMikgFBVV95cUxNajAtMlVKY1p0a3ZRdHBXT053LXR1SkxIVTdKMU45NmdOSjc5ZTBoOFlVemZJOEFRVDJjWndLZ2gtQmhscHpKVGFBM2plWmhmUmRfUmlPbE81SVYxREg1QkZWU200a1h4WFRZc1dqdW5GSW5Yb3REaWZJSjVNay1Rb2owXy1vWmRaT3NoNjN1WVl4UQ?oc=5',
      urlToImage: null,
      publishedAt: '2024-08-08T06:49:30Z',
      content: null,
    ),
    ArticleModel(
      author: 'The Washington Post',
      title:
          'Taylor Swift cancels Vienna shows after two arrested on suspicion of plotting attack - The Washington Post',
      description: null,
      url:
          'https://news.google.com/rss/articles/CBMipAFBVV95cUxOQTJ3MmhjYUZpem9tcDlKQmZadURXazl1NmVBdUxXUkJHU2dWYWpVTG9iNEhKbnRoMDBPMWlWN2RITVR5TEhfbm1uVHotSUdITmpHX3hnajFERGN5Yy1TajhqOVl4eXNic21WNjJGVzNoenJ4MHRpTVc1N2pZZVRCYVVIM0pKZks2WmVVMTE3ZWR2UXZyWFVGLUtMNFNDaklVTmZTaQ?oc=5',
      urlToImage: null,
      publishedAt: '2024-08-08T06:34:23Z',
      content: null,
    ),
    ArticleModel(
      author: 'BBC.com',
      title:
          'Why has Ukraine launched a raid into Russia’s Kursk region? - BBC.com',
      description: null,
      url:
          'https://news.google.com/rss/articles/CBMikgFBVV95cUxNajAtMlVKY1p0a3ZRdHBXT053LXR1SkxIVTdKMU45NmdOSjc5ZTBoOFlVemZJOEFRVDJjWndLZ2gtQmhscHpKVGFBM2plWmhmUmRfUmlPbE81SVYxREg1QkZWU200a1h4WFRZc1dqdW5GSW5Yb3REaWZJSjVNay1Rb2owXy1vWmRaT3NoNjN1WVl4UQ?oc=5',
      urlToImage: null,
      publishedAt: '2024-08-08T06:49:30Z',
      content: null,
    ),
    ArticleModel(
      author: 'The Washington Post',
      title:
          'Quincy Hall, to whom nothing’s been given, took the Olympic 400 meters - The Washington Post',
      description: null,
      url:
          'https://news.google.com/rss/articles/CBMiqAFBVV95cUxPcjBRNmRDVEZCR0t6MmZLQ0tOUXIyakVlbklrTzgtd0ZNLW8ya1F6U25vZ0xGbzNuNjhQRW9WUEd1d0dPNW1aYUItR2FWWGd6UVdzeWN3MnZyS3FQaHliaXBvY1UxQnBzN0ZYOFZ1bWNlQ0gzX0JoVWtwd2h3cFlLa3pneXh4N1RNbUZLYnpmU1poQWxPQ2JOenVDZjVKbDNabF9sWlpRVGk?oc=5',
      urlToImage: null,
      publishedAt: '2024-08-08T04:07:40Z',
      content: null,
    ),
  ];

  setUp(
    () {
      mockHomeLocalDataSource = MockHomeLocalDataSource();
    },
  );

  // ---------- Get top headlines ---------- //
  test(
    'Get top headlines local and throw HiveError',
    () async {
      when(
        mockHomeLocalDataSource.getTopHeadlinesLocal(),
      ).thenThrow(
        HiveError(
          '',
        ),
      );
      try {
        await mockHomeLocalDataSource.getTopHeadlinesLocal();
        assert(false);
      } catch (exception) {
        assert(true);
      }
    },
  );

  test(
    'Get top headlines local and return articles list',
    () async {
      when(
        mockHomeLocalDataSource.getTopHeadlinesLocal(),
      ).thenAnswer(
        (_) async => articles,
      );
      final List<ArticleModel> response =
          await mockHomeLocalDataSource.getTopHeadlinesLocal();
      expect(
        articles,
        response,
      );
    },
  );
}
