import 'package:flutter/foundation.dart';

import 'screening_model.dart';
import 'trending_model.dart';

class HomeModel extends ChangeNotifier {
  bool isLoading = true;

  final ScreeningModel screeningModel;
  final TrendingModel trendingModel;

  HomeModel({required this.screeningModel, required this.trendingModel}) {
    load();
  }

  load() {
    isLoading = true;
    notifyListeners();
    _load();
  }

  Future<void> _load() async {
    await Future.wait(
        [screeningModel.loadTopScreeningMovies(), trendingModel.loadTopTrendingMovies()]);

    isLoading = false;
    notifyListeners();
  }
}
