import 'package:flutter/foundation.dart';
import 'package:screenwave/vo/movie.dart';
import '../helper/api_helper.dart';
import '../vo/category.dart' as vo;

class ScreeningModel extends ChangeNotifier {
  vo.Category? category;

  Future<void> loadTopScreeningMovies() async {
    var data = await requestAPI("/dev/test/screening", "GET");
    category = vo.Category.fromMapForScreening(data);
    notifyListeners();
  }

  Future<List<Movie>> loadAllScreeningMovies() async {
    var data = await requestAPI("/dev/test/screening?see-all=true", "GET");
    var category = vo.Category.fromMapForScreening(data);
    return List.from(category.movies);
  }
}
