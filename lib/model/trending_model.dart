import 'package:flutter/foundation.dart';

import '../helper/api_helper.dart';

import '../vo/category.dart' as vo;
import '../vo/movie.dart';

class TrendingModel extends ChangeNotifier {
  vo.Category? category;

  Future<void> loadTopTrendingMovies() async {
    var data = await requestAPI("/dev/test/trending", "GET");
    category = vo.Category.fromMapForTrending(data);
    notifyListeners();
  }

  Future<List<Movie>> loadAllTrendingMovies() async {
    var data = await requestAPI("/dev/test/trending?see-all=true", "GET");
    var category = vo.Category.fromMapForTrending(data);
    return List.from(category.movies);
  }
}
